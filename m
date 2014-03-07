Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id D43AD6F57A;
	Fri,  7 Mar 2014 18:28:49 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h14so2531014eaj.28
	for <multiple recipients>; Fri, 07 Mar 2014 10:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=h6No4Vnowd8hMjVfGYRZGpbUOkHYDilP5RbyXkUxIJU=;
	b=jb532QrEtPdEh0B17pz60GEpgAK+D9baWqGpyASyR8WR5uF2tA7JhbyN2nRgUsNtEz
	OnzuEdG4IH9bwT2FNRLky+v6xVeU19Xtt8wkjzHLf3XV2v7nrq/UzCRXL3bjS3571VLs
	bgo8g8922dlb7lCWlydY6A3NrGvpKycmiUUW+8ESHIE95Nf8ALU4YY78iMHKdTV495tt
	CiD977B3OXt4HCpvT0Y5gB2UualEnygTFL5ZNtJDUNlYO1jYoEWU0xYdC83b/qoregMq
	2AnRJpoWSwpjON4ROgeANwwu1SaLxl1adytR+fReQF52PBg0mWmAgd61Qwft9HY0kqeB
	m9mg==
X-Received: by 10.14.216.3 with SMTP id f3mr20696845eep.66.1394216930096;
	Fri, 07 Mar 2014 10:28:50 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	i1sm9605809eeo.16.2014.03.07.10.28.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Mar 2014 10:28:48 -0800 (PST)
Date: Fri, 7 Mar 2014 19:28:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20140307182858.GL26981@jama>
References: <1394125490-2945-1-git-send-email-Martin.Jansa@gmail.com>
	<2403049.xWs40izQYL@peggleto-mobl5.ger.corp.intel.com>
	<20140306192122.GJ26981@jama>
	<3158053.US3HkBfSAc@peggleto-mobl5.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <3158053.US3HkBfSAc@peggleto-mobl5.ger.corp.intel.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH] bash-completion: remove allarch
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
X-List-Received-Date: Fri, 07 Mar 2014 18:28:51 -0000
X-Groupsio-MsgNum: 51033
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TvNyW/zmhQDwPqM/"
Content-Disposition: inline

--TvNyW/zmhQDwPqM/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 07, 2014 at 10:09:00AM +0000, Paul Eggleton wrote:
> On Thursday 06 March 2014 20:21:22 Martin Jansa wrote:
> > On Thu, Mar 06, 2014 at 05:59:29PM +0000, Paul Eggleton wrote:
> > > On Thursday 06 March 2014 18:04:50 Martin Jansa wrote:
> > > > * it has runtime dependency on TUNE_PKGARCH bash, so it cannot be
> > > > allarch
> > >=20
> > > As we've already discussed this is not universally true. There are ot=
her
> > > ways to solve this.
> >=20
> > Like making it special case like packagegroups? That is still making me
> > headaches when some library (for some reason) included in packagegroup
> > is renamed thanks to debian.bbclass and packagegroup isn't rebuilt, so
> > it breaks do_rootfs..
>=20
> Did you report this? FWIW it's the first I recall hearing of the problem;=
=20
> perhaps I just missed it.

I've discussed this with RP on IRC, but haven't filled the bugzilla
ticket, my fault, will do that later.

> > I would rather build bash-completion only once per architecture than
> > rebuilding it as "allarch" every time I'm building for MACHINE with
> > different TUNE_PKGARCH.
>=20
> As I said last time, I'm not arguing that rebuilding allarch recipes on=
=20
> machine change is preferable - obviously it isn't. On the other hand, wha=
t=20
> you're doing with this kind of change is telling the build system that th=
e=20
> recipe needs to be built differently depending on what the target archite=
cture=20
> is, which is *not* true; this is only being done to work around the build=
=20
> system making an assumption that the rebuild needs to happen. Fix the=20
> assumption and the problem is fixed, properly.=20
>=20
> If we need to make changes to the core or BitBake to make it easier to ha=
ndle=20
> this properly, by all means let's do that; but if we go down the road of=
=20
> applying the workaround to every recipe where we hit this issue (and as w=
e=20
> have seen it's not just one or two recipes) we will never get around to f=
ixing=20
> the underlying problem.

What I'm trying to do is to prevent rebuilding them until the
underlaying problem is fixed (which can be tracked in bugzilla with 2
very simple recipes as reproducer).

I don't want this to show in every build and as "known-possitive" in
every sstate-diff-machine.sh call. It's less pain to just rebuild them
once per TUNE_PKGARCH even when they could be allarch.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TvNyW/zmhQDwPqM/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMaD+oACgkQN1Ujt2V2gByTOQCfbzY8CHQyCI8deYKq8alDc5Nu
JSAAnis4VsachSckxXwfrzToUBrrIFr5
=GDbh
-----END PGP SIGNATURE-----

--TvNyW/zmhQDwPqM/--
