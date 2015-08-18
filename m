Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177])
	by mail.openembedded.org (Postfix) with ESMTP id 25A5C60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 11:16:27 +0000 (UTC)
Received: by wicja10 with SMTP id ja10so92024210wic.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UphTzcGIDbYNOaOBG7lP7fLLTlsc1RvRVpKzUI3sCrI=;
	b=R4OUsO0OZJ1Bz9HLpX6DSq9/zpJpMv14SSyNWFXn521rUygb5Sl29i0yMMPjtDrCyQ
	q/9dq3i1aOfkV6U6Qmg7ubjb89fr2lTH0FGDpSM/KgEFD1IHb0kpDztRvopkHNPBohZ0
	J0Uu0PlnyaLwZdoq1dwQorkGoa9vzJ/SusGCDKnwOQEULaRyX6ObkH69/0u0PAoeuHV0
	kV6z1HtCZlwkIc9ZLHBKdFpsfrnm2Gc5CLlgA36DldRyWmyQgGMtNwtgrBqqVvrCLHlj
	f3gEPZ3cYB3ftmOTPVA8eTR3OrARk1luADW3F+taOj9BclLPtWkUEwO9nw7rNgSnJAUV
	puuQ==
X-Received: by 10.180.23.33 with SMTP id j1mr41351454wif.44.1439896587502;
	Tue, 18 Aug 2015 04:16:27 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	fn8sm20933109wib.2.2015.08.18.04.16.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 04:16:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 18 Aug 2015 13:16:30 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150818111630.GB30532@jama>
References: <55C637DB.9010106@balister.org> <55C8956D.9080508@linux.intel.com>
	<55C8F83F.4010003@balister.org> <55C9F7F2.2060502@linux.intel.com>
	<CAMKF1soCEwGMkVfHsMzp3Wt49LKQusLC8jTrYygCSsBgjHZQQw@mail.gmail.com>
	<CAJTo0LYXHLBF52jmfLF4azE-BSKj2F=9-G=8MXcFo36FgE6+0A@mail.gmail.com>
	<CAP9ODKpXke_FaA_bSUtPSjqMKWtUsyU44qsm73KfZNrajfZrnQ@mail.gmail.com>
	<55CC588E.6030200@balister.org> <20150818090328.GG2458@jama>
	<1439892671.12105.35.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1439892671.12105.35.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: meta-gplv2? [Was Re: parted_1.8.6.bb: add parted that not GPLv3]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 11:16:28 -0000
X-Groupsio-MsgNum: 69562
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline

--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2015 at 11:11:11AM +0100, Richard Purdie wrote:
> On Tue, 2015-08-18 at 11:03 +0200, Martin Jansa wrote:
> > On Thu, Aug 13, 2015 at 10:42:54AM +0200, Philip Balister wrote:
> > > On 08/11/2015 10:46 PM, Otavio Salvador wrote:
> > > > On Tue, Aug 11, 2015 at 5:36 PM, Burton, Ross <ross.burton@intel.co=
m> wrote:
> > > >>
> > > >> On 11 August 2015 at 16:46, Khem Raj <raj.khem@gmail.com> wrote:
> > > >>>
> > > >>> can we freeze this thread please.
> > > >>
> > > >>
> > > >> Or more usefully, reboot it.  Philip, you're turning into Koen!  A=
lex, if
> > > >> someone on this list asks what Poky is, 99% of the time they're tr=
olling.
> > > >> :)
> > > >>
> > > >> The original and unanswered question was "should oe-core continue =
to
> > > >> maintain GPLv2 recipes where upstream has moved to GPLv3 or should=
 those
> > > >> recipes move to a standalone layer" with various implied questions:
> > > >>
> > > >> - If the v2 recipes move to a separate layer, who own/maintains/te=
sts it?
> > > >> - Should there be v2 recipes for every recipe that has moved to v3=
, or only
> > > >> (as is now) the "more-core" recipes (currently YP tests that core-=
image-base
> > > >> builds without GPLv3, nothing else more complicated)
> > > >> - Should meta-gplv2 only contain recipes from oe-core, or all laye=
rs?  If
> > > >> other layers decide to hold both v3 and v2 recipes (not that I'm a=
ware any
> > > >> have), what makes oe-core special?
> > > >>
> > > >> I'm torn, Richard is torn.  Neither of those are useful to forming=
 a
> > > >> decision.  Does anyone else have any *useful* feedback?
> > > >=20
> > > > I think it is a matter of resource usage.
> > > >=20
> > > > Up to now, the GPLv2 maintenance has not been so hard and thus I wo=
uld
> > > > say for us to stay as is for now. We should revisit this for every
> > > > release and review if it is time for split it or not.
> > > >=20
> > >=20
> > > This would be a good time to remind us who the audience is for the gp=
lv2
> > > recipes so we understand the amount of manpower behind their maintena=
nce.
> > >=20
> > > My concern keeping then in core is that the commnunity who uses them
> > > will reduce over time and they will bitrot. If that happens, we should
> > > create a layer for them and remove them from core.
> >=20
> > It's still better to let them bitrot collectively in central layer than
> > every OE user with this requirement maintaining old GPLv2 recipes in own
> > layers and re-inventing the workarounds needed to build the rest of the
> > system with latest upstream layers.
>=20
> I don't think anyone is suggesting we just abandon the idea and force
> everyone to do this individually. The question is more about whether it
> still makes sense to have the GPLv2 recipes in OE-Core or a separate
> layer. It does also raise questions of scope, there are GPLv2 recipes
> which OE-Core doesn't have and are not part of its stated policy (e.g.
> screen being the current example).
>=20
> I do think its right to ask these questions although I'm still undecided
> about what the best solution is...

Is it still true that autobuilder cannot test different sets of layers
for different builds?

It would be nice to see meta-gplv2 as separate layer, but tested and
maintained as it is now inside oe-core (possibly with more help from
outside especially if we can move some other recipes there as well).
That way autobuilder can test meta-gplv2 layer only in non-GPLv3 builds
and people who don't mind having GPLv3 components don't need to see
"bit-rotten old versions" in proper oe-core.

I was suggesting the same for sato in OEDAM (core-image built without
meta-sato in one autobuilder job, then sato-image with meta-sato
included in separate job), but IIRC there were some autobuilder
limitations which prevented to use metadata layers like this (which
seems very sad).

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXTFA0ACgkQN1Ujt2V2gBzFagCffzoEKyKLdHVgHmt2UsxxiGKD
G6wAoI4a/F5W7w/XniJlYlLKOhZW79kF
=lGrL
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
