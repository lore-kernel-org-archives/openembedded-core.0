Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T2MIJ-0005VH-1z
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 15:08:55 +0200
Received: by weyr6 with SMTP id r6so2530895wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=TmLTLskmLv1YVTzPb9XdEz7yWSUeZXab2LF9F4Y9w54=;
	b=n9yfbN6nIMUwtI42UCGOa9ztST7Qs9FmXlGA5jTAkAaBzfMAagYfKuUI1I8fYefrop
	nVuXqUq+86m/DbnlrpuM01BN4PLPm8YFLmkv0gkB73Y+GFIkV6NgP5sHeEyLLtMlGt5e
	j6i2v/6RGHjYLPPsyUEG0UDYhQBx4eCM8vzxp9rIv3HqW68fFxu4cWZuBxSgIdsJ45BZ
	fLy1Cv1n/SK8XGf83/qBWJrW6Om2WJ6brEsqdRh5Pjazl48KnJSKvicV0Z5xfh4rSHk4
	40tjbCFei4gwrR87Sph1j/KnRQQoCEHh/QovA8+Wfqh2dEjW8Tx16skRfJ/ZppOjrA1y
	wVyw==
Received: by 10.216.93.6 with SMTP id k6mr2690522wef.86.1345208216552;
	Fri, 17 Aug 2012 05:56:56 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w7sm9646086wiz.0.2012.08.17.05.56.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 05:56:55 -0700 (PDT)
Date: Fri, 17 Aug 2012 14:56:53 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120817125653.GL3625@jama.jama.net>
References: <cover.1345203203.git.ross.burton@intel.com>
	<3890692.qcbBpDRmfO@helios> <20120817123916.GJ3625@jama.jama.net>
	<5851541.vDHObiJJ2D@helios> <20120817125427.GK3625@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120817125427.GK3625@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove older GTK+ versions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 13:08:55 -0000
X-Groupsio-MsgNum: 27717
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fDERRRNgB4on1jOB"
Content-Disposition: inline

--fDERRRNgB4on1jOB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 02:54:27PM +0200, Martin Jansa wrote:
> On Fri, Aug 17, 2012 at 01:48:45PM +0100, Paul Eggleton wrote:
> > On Friday 17 August 2012 14:39:16 Martin Jansa wrote:
> > > Should I file a but to fix DEFAULT_PREFERENCE between layers?
> >=20
> > We've discussed this problem before - the trouble is we would have to c=
hange=20
> > the way the version preference calculation works, and I'm not sure we w=
ill be=20
> > able to do that without breaking assumptions that people currently rely=
 upon=20
> > in the process. By all means file a bug, but I think coming up with a p=
ractical=20
> > solution is going to be tricky.
> > =20
> > > Because there is also use case when newer development version is added
> > > to e.g. meta-oe with negative D_P and only users who decide to test/u=
se
> > > that version should get it, if they define P_V for this new version.
> >=20
> > This is also undesirable for meta-oe IMHO - as a general principle, met=
a-oe=20
> > shouldn't be trying to both add additional recipes *and* provide newer/=
older=20
> > versions of recipes that are in OE-Core. Please, let's get the new vers=
ions=20
> > into OE-Core or if they're too risky/broken for some use cases for that=
, then=20
> > they belong in people's distro layers. (Practically I don't think there=
 are=20
> > that many instances of new versions of OE-Core recipes that people want=
 to use=20
> > that would be actually rejected by OE-Core).
>=20
> What if newer version is needed for recipe which exists only in meta-oe?
>=20
> I had this in meta-efl where webkit-efl was sometimes segfaulting when
> older stable version of libsoup2.4 was used, upstream solved that by
> recommending development version of libsoup2.4, but as soon as I've
> added it to meta-efl everybody (including users which don't use
> webkit-efl from meta-efl - don't need this libsoup2.4) got it as
> default.
>=20
> Yes I could have added this libsoup2.4 only to meta-shr (where I had
> P_V for that) and keep webkit-efl broken for everyone else, or try to
> add developement version of libsoup2.4 to oe-core..

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2964

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fDERRRNgB4on1jOB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAuP5UACgkQN1Ujt2V2gBza8ACglr6B3ARPM0/3MYGCNCenCC0/
4SYAoKSpRmjwvyGct1CYY3Y40quYibQD
=W4AK
-----END PGP SIGNATURE-----

--fDERRRNgB4on1jOB--
