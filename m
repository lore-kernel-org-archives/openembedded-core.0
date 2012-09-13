Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TC8Vd-0003iD-9J
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 14:27:05 +0200
Received: by bkcik5 with SMTP id ik5so459634bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2012 05:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=az2030/x4LFk0eGRYcWYXtFwisFDv1oT3MSxc5EofWQ=;
	b=VxvsNw49tXk5hEeSxTsd95ozjKib+HSUc7p5wUi5tFQQJtem6vHgPV+Ywdp9awgWvG
	HC5FuDBZe5HCq7sOXriqk137ae6Tj1EmADbCLsAWR2V/XysBRRS0qo1ndlWgvcKgPAZ5
	wjw1inL1CUcICyc9uMiF4XBCpP0fPxyXJHa1F45HUVbS1PaKypKfRv7qQWmz+7XXAbtM
	5hOre7FDR+/0T3iiS+k9CCS0dIVay78WvVdeLiGXCIts5QvtlBXjQwp/16SSIE6wc4/g
	6P8aTQ0tcTkLILHF3gBK0FWuZWHKBRNBlzEmgw0rZNXhmygk/Re4BymAr4FvY1EqU1yx
	LLpA==
Received: by 10.204.148.12 with SMTP id n12mr929983bkv.6.1347538471809;
	Thu, 13 Sep 2012 05:14:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fu8sm14152519bkc.5.2012.09.13.05.14.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Sep 2012 05:14:30 -0700 (PDT)
Date: Thu, 13 Sep 2012 14:14:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120913121431.GB11252@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted>
	<20120913062017.GA11252@jama.jama.net>
	<1347532926.11710.66.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1347532926.11710.66.camel@ted>
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
X-List-Received-Date: Thu, 13 Sep 2012 12:27:05 -0000
X-Groupsio-MsgNum: 29231
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KFztAG8eRSV9hGtP"
Content-Disposition: inline

--KFztAG8eRSV9hGtP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 13, 2012 at 11:42:06AM +0100, Richard Purdie wrote:
> On Thu, 2012-09-13 at 08:20 +0200, Martin Jansa wrote:
> > On Wed, Sep 12, 2012 at 03:33:03PM +0100, Richard Purdie wrote:
> > > On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> > > > Hi,
> > > >=20
> > > > when building spitz and qemuarm (both produces packages in armv5te =
feed)
> > > > resulting packages are tuned with -mtune=3Dxscale (when built for s=
pitz)=20
> > > > or -mtune=3Darm926ej-s (when built for qemuarm).
> > > >=20
> > > > From
> > > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
> > > > Firstly, if you go changing the tune parameters in a given machine,
> > > > you are expected to use a different PACKAGE_ARCH. If you do that, y=
ou
> > > > will get a different package feed for the different binaries,
> > > > different WORKDIR and so on. This was always the way the package
> > > > architectures was intended to work and nothing has changed there. Y=
es,
> > > > you as the user changing various variables can create inconsistent
> > > > package feeds. There are 101 ways you can do that, the simple answer
> > > > is just don't. We're therefore unlikely to add MACHINE to DEPLOY_DIR
> > > > or remove PACKAGE_ARCH, please just use it as its intended.
> > > >=20
> > > > Does qemuarm use oe-core as it's intended?
> > > >=20
> > > > Shouldn't spitz produce something like armv5te-xscale and qemuarm a=
rmv5te-arm926ejs?
> > > > It would cause all recipes to build again (cannot share armv5te fee=
d anymore),
> > > > but at least it would build it and user will really get it on targe=
t, right now
> > > > opkg upgrade can download some packages with xscale some with arm92=
6ej-s.
> > > >=20
> > > > $ ~/bitbake/bin/bitbake-diffsigs
> > > >   stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-heade=
rs-3.4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
> > > >   stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-hea=
ders-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
> > > >   basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff=
8613d0aafe60bef1a1e9469a1
> > > >   Variable TUNE_CCARGS value changed from
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${A=
RMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${A=
RMPKGSFX_THUMB}", "", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT=
}", "", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno=
-thumb-interwork", "-mthumb-interwork", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("T=
UNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3D=
softfp", d), "" ,d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale"=
, "", d)}
> > > >   to
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${A=
RMPKGSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${A=
RMPKGSFX_THUMB}", "", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT=
}", "", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno=
-thumb-interwork", "-mthumb-interwork", d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("T=
UNE_FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3D=
softfp", d), "" ,d)}
> > > >   ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm9=
26ej-s", "", d)}
> > > >=20
> > >=20
> > > This is a tricky one. As others have mentioned, this is a tune
> > > parameter, not an arch one and as such the binaries are compatible wi=
th
> > > each other although they potentially are compiled differently with
> > > different optimisations.
> > >=20
> > > As such, mixing the feeds is permitted and will not cause any real wo=
rld
> > > usage problem. As you point out, sstate is much more sensitive to this
> > > kind of change and is correctly deciding the output is different thou=
gh.
> > >=20
> > > I think my preferred approach would be to have the tune files do
> > > something like:
> > >=20
> > > -mtune=3D${ARMV5TEDEFAULTTUNE}
> > >=20
> > > and then the user can set ARMV5DEFAULTTUNE to whatever the believe is=
 a
> > > appropriate. This would result in the package feed at least having a
> > > consistent state of one tune and sstate would be happy. It then becom=
es
> > > a distro policy decision which is what it should be. ARMV5TEDEFAULTTU=
NE
> > > would default to the current values meaning the distro would then just
> > > do:
> > >=20
> > > ARMV5TEDEFAULTTUNE_poky =3D "xscale"
> > >
> > > and hence make their decision. Of course the distro could also decide=
 to
> > > split the package architectures up which is equally fine.
> > >=20
> > > Does something like that sound like it would work?
> >=20
> > My solution seems to be a bit more flexible then this.
>=20
> Which cases does it enable which the above doesn't?

To have separate binary feeds for some packages while keeping most of
other packages in armv5te feed without any -mtune or with some
ARMV5TEDEFAULTTUNE.

But -mtune=3D${ARMV5TEDEFAULTTUNE} in tune-arm926ejs.inc with=20
xscale value set through ARMV5TEDEFAULTTUNE_disto doesn't look very
intuitive.

And how many .*DEFAUTTUNE variables distro should set?

Anyway I'll be off for next 10 days or so..
=20
> I'm a little worried about adding more indirection to the DEFAULTTUNE
> variable itself since the whole tune situation is already convoluted and
> indirected enough without adding another level of it :/. That variable
> is the one exposed to the user straight away, not hidden more behind the
> scenes.
>=20
> Taking a step back and looking at the APIs I'm really not very happy
> with the usability of them already and I don't think this helps.
>=20
> Someone commented about the ppc situation and I was told that there, the
> binaries are incompatible with each other. It is more unusual to have
> situations where there are micro-optimisations through -mtune yet the
> binaries remain compatible.
>=20
> Cheers,
>=20
> Richard
>=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--KFztAG8eRSV9hGtP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBRziYACgkQN1Ujt2V2gBx1hACguoi3DQVxXpVPqAB0JrdIABYb
AKwAmwXQEs06sFkQaw4eFKz752Z50Es/
=LKvK
-----END PGP SIGNATURE-----

--KFztAG8eRSV9hGtP--
