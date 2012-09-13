Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TC2yn-0005XM-D6
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 08:32:49 +0200
Received: by weyr6 with SMTP id r6so1480914wey.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 23:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=li/WVAMlSC0c/8sjfq8ZkN8PxhhrPTD5aNOnCbjMFQs=;
	b=Hs5pvSjceOnuDRJPA8k/67W9EZjI/4VARnveS8OaZUwTK4XwAE8UXdSS1rDz4toAN6
	sCaLw0aPzbvMcYyno84t/pFkofBT4EpbbYyLQ3Hrn35ML01WfueN9zJ2uGCeqWbR2QTC
	iWK0190gsLDGnVS6GowMweuoXv/+LBvZI9ao3TgY3+uOCgHdRdq2fDoNrX1iQjeHrvA+
	Imw3v47sSSpQOOK8hVu6rscIBT/r1gDKwwUJLvbPcb3ssp5l3C6txZI1sCC4ZMRFiDXm
	/hf1A39KTq4dKSrMokEi2QCBE6PnaH4DMi2vTXM84bgsE50sAbvPRzGeuiJ/+eznVvx6
	FVgw==
Received: by 10.180.93.8 with SMTP id cq8mr2371672wib.16.1347517216316;
	Wed, 12 Sep 2012 23:20:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm11919809wiz.4.2012.09.12.23.20.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Sep 2012 23:20:15 -0700 (PDT)
Date: Thu, 13 Sep 2012 08:20:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120913062017.GA11252@jama.jama.net>
References: <20120911130155.GC14077@jama.jama.net>
	<1347460383.11710.34.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1347460383.11710.34.camel@ted>
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
X-List-Received-Date: Thu, 13 Sep 2012 06:32:49 -0000
X-Groupsio-MsgNum: 29219
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 12, 2012 at 03:33:03PM +0100, Richard Purdie wrote:
> On Tue, 2012-09-11 at 15:01 +0200, Martin Jansa wrote:
> > Hi,
> >=20
> > when building spitz and qemuarm (both produces packages in armv5te feed)
> > resulting packages are tuned with -mtune=3Dxscale (when built for spitz=
)=20
> > or -mtune=3Darm926ej-s (when built for qemuarm).
> >=20
> > From
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1916#c5
> > Firstly, if you go changing the tune parameters in a given machine,
> > you are expected to use a different PACKAGE_ARCH. If you do that, you
> > will get a different package feed for the different binaries,
> > different WORKDIR and so on. This was always the way the package
> > architectures was intended to work and nothing has changed there. Yes,
> > you as the user changing various variables can create inconsistent
> > package feeds. There are 101 ways you can do that, the simple answer
> > is just don't. We're therefore unlikely to add MACHINE to DEPLOY_DIR
> > or remove PACKAGE_ARCH, please just use it as its intended.
> >=20
> > Does qemuarm use oe-core as it's intended?
> >=20
> > Shouldn't spitz produce something like armv5te-xscale and qemuarm armv5=
te-arm926ejs?
> > It would cause all recipes to build again (cannot share armv5te feed an=
ymore),
> > but at least it would build it and user will really get it on target, r=
ight now
> > opkg upgrade can download some packages with xscale some with arm926ej-=
s.
> >=20
> > $ ~/bitbake/bin/bitbake-diffsigs
> >   stamps.1347348910/spitz/armv5te-oe-linux-gnueabi/linux-libc-headers-3=
=2E4.3-r0.do_configure.sigdata.04b364a15889fcff7502614f1c116abc
> >   stamps.1347348910/qemuarm/armv5te-oe-linux-gnueabi/linux-libc-headers=
-3.4.3-r0.do_configure.sigdata.656f0583be969b427f040f2e143bcb14
> >   basehash changed from 7fe9c0a3455dac20ba6a90ed337b097e to d8dd2ff8613=
d0aafe60bef1a1e9469a1
> >   Variable TUNE_CCARGS value changed from
> >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPK=
GSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPK=
GSFX_THUMB}", "", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", =
"", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thu=
mb-interwork", "-mthumb-interwork", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_=
FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoft=
fp", d), "" ,d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "xscale", "-mtune=3Dxscale", ""=
, d)}
> >   to
> >   ${@bb.utils.contains("TUNE_FEATURES", "armv5", "-march=3Darmv5${ARMPK=
GSFX_THUMB}${ARMPKGSFX_DSP}", "", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "armv4", "-march=3Darmv4${ARMPK=
GSFX_THUMB}", "", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "thumb", "${ARM_THUMB_M_OPT}", =
"", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "no-thumb-interwork", "-mno-thu=
mb-interwork", "-mthumb-interwork", d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "vfp", bb.utils.contains("TUNE_=
FEATURES", "callconvention-hard", "-mfloat-abi=3Dhard", "-mfloat-abi=3Dsoft=
fp", d), "" ,d)}
> >   ${@bb.utils.contains("TUNE_FEATURES", "arm926ejs", "-mtune=3Darm926ej=
-s", "", d)}
> >=20
>=20
> This is a tricky one. As others have mentioned, this is a tune
> parameter, not an arch one and as such the binaries are compatible with
> each other although they potentially are compiled differently with
> different optimisations.
>=20
> As such, mixing the feeds is permitted and will not cause any real world
> usage problem. As you point out, sstate is much more sensitive to this
> kind of change and is correctly deciding the output is different though.
>=20
> I think my preferred approach would be to have the tune files do
> something like:
>=20
> -mtune=3D${ARMV5TEDEFAULTTUNE}
>=20
> and then the user can set ARMV5DEFAULTTUNE to whatever the believe is a
> appropriate. This would result in the package feed at least having a
> consistent state of one tune and sstate would be happy. It then becomes
> a distro policy decision which is what it should be. ARMV5TEDEFAULTTUNE
> would default to the current values meaning the distro would then just
> do:
>=20
> ARMV5TEDEFAULTTUNE_poky =3D "xscale"
>
> and hence make their decision. Of course the distro could also decide to
> split the package architectures up which is equally fine.
>=20
> Does something like that sound like it would work?

My solution seems to be a bit more flexible then this.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBReyEACgkQN1Ujt2V2gBzGCQCgox7/aSPXY7WZ1GQpllIExg/j
JdIAnRAUYDtQGqfA+9UQr+t+qJR2j6T7
=Ci2+
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
