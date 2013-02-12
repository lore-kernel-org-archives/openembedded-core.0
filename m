Received: from mail-da0-f45.google.com ([209.85.210.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1U5M8s-0002BP-3b; Tue, 12 Feb 2013 21:08:18 +0100
Received: by mail-da0-f45.google.com with SMTP id w4so181613dam.32
	for <multiple recipients>; Tue, 12 Feb 2013 11:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=s8ZZC9ZvtdKqhv+oZ/+zMCdVBv3VTFw9hpobFsA/8uU=;
	b=dHpjTsnLGW25ulFYv3Q7JH/yJQwMItFyUFpW8OUBj9cH5P+Aq1WpcDNA42UE8r83so
	8mKNUusFNoYgyQUExkxPlJwXY5dCq4Qx3FV8CwsC5oqZ+fBMLk0Lo+HS03K8Z1dXl9Y2
	E9FHZtrE3aVB36r7FsndK3K/nu2x4DQH5b2squWwtNUjmMuTbw6Pg7bgIPGZC9eyJO5i
	8vhZxaAeLw2elJKuDLtHCApPYcXgtMA9DQAxLAisVGnqMQmbW5Gmod+B8/N7+fE8i25a
	agSLXjKaV3gAwNlfKHKPR0uc/L2xMcwEFWv+dxLX/icifcWGr7uLGZi4cq6nMvQEujvQ
	hxoQ==
X-Received: by 10.66.84.232 with SMTP id c8mr55615808paz.8.1360698709089;
	Tue, 12 Feb 2013 11:51:49 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id q4sm77336679paz.20.2013.02.12.11.51.46
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 11:51:48 -0800 (PST)
Date: Tue, 12 Feb 2013 20:51:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130212195143.GE3300@jama>
References: <2760168.9kFd94gL1F@helios> <20130212191902.GD3300@jama>
	<26170862.UdgPXC9k0H@helios>
MIME-Version: 1.0
In-Reply-To: <26170862.UdgPXC9k0H@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 20:08:21 -0000
X-Groupsio-MsgNum: 35388
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 12, 2013 at 07:32:33PM +0000, Paul Eggleton wrote:
> On Tuesday 12 February 2013 20:19:02 Martin Jansa wrote:
> > On Mon, Feb 11, 2013 at 05:09:01PM +0000, Paul Eggleton wrote:
> > > * tslib: OE-Core has the 1.0 release version, meta-oe has a git recipe
> > > that is ahead of 1.0; the OE-Core version has two patches not in the
> > > meta-oe version but that both have been merged upstream in the git
> > > revision being used in the meta-oe version. There is no newer stable
> > > release. What do we do here? Should we ask upstream (Chris) for a new
> > > stable release?
> >=20
> > tslib is also requested on devices where kernel driver returns too much
> > noise, tslib can filter that, evdev needs separate filter like
> > http://atrey.karlin.mff.cuni.cz/~metan/evfilter/
> > but that isn't integrated in OE.
>=20
> OK. I think the best course of action is to petition upstream for a stabl=
e=20
> release and then update OE-Core to that, then we can drop the recipe from=
=20
> meta-oe without ill effect.

Agreed,
=20
> > > * xserver-nodm-init: the two versions are quite distinct. Not sure I
> > > understand the full history here but perhaps someone else can fill in=
 the
> > > blanks...?
> >=20
> > The biggest difference is integrated xinput-calibrator and use of
> > xserver-common_1.34.bb
>=20
> So can you see a means for us to move this into OE-Core? Where are the po=
ints=20
> of conflict?

xinput-calibrator is now being reworked by Andreas so we should at least
wait for this rework to settle down and xserver-common is similar to
formfactor, a bit more flexible but a lot worse to maintain for new
MACHINES (FWIW all local patches are waiting in florian mbox).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEanU8ACgkQN1Ujt2V2gBxi8ACfbGe87PaoAKI36eMSP+GLYLB/
FtUAniLm3yJvaB+l4j2ovoU95i/TOu8J
=YRj1
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
