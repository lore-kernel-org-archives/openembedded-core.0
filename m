Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RZKd4-0003oV-UM
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 11:58:08 +0100
Received: by eaal1 with SMTP id l1so417043eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 02:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=0nd4tAPge7hUmpV09PqQ2bOwfjM/sA9LtU05U3ujeIw=;
	b=mA3/PruQiAVlWoGy9cAclCaHlPGy7dqH3QzE+fZSNQx0/Nk6CG5QLL9MuTchMAWq7B
	EaZ3dpZvlITAvYNJ/jzaq8wccyg4Ta49vZDqi0XBf/vb4Bggci4pgABPaxAR7V3SurUr
	gzBWponja+4TBdUpiNSzMDUTV9Clm56QZz5YI=
Received: by 10.213.113.142 with SMTP id a14mr672332ebq.92.1323514274392;
	Sat, 10 Dec 2011 02:51:14 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id q28sm43960646eea.6.2011.12.10.02.51.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 02:51:13 -0800 (PST)
Date: Sat, 10 Dec 2011 11:51:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Wolfgang Denk <wd@denx.de>
Message-ID: <20111210105101.GB3986@jama.jama.net>
References: <1323415475-21361-1-git-send-email-fransmeulenbroeks@gmail.com>
	<20111209075504.GA4082@ad.chargestorm.se>
	<20111209080731.GB3848@jama.jama.net>
	<20111209233058.E7DC41926E19@gemini.denx.de>
MIME-Version: 1.0
In-Reply-To: <20111209233058.E7DC41926E19@gemini.denx.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: renamed dir from uboot to the more appropriate u-boot
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
X-List-Received-Date: Sat, 10 Dec 2011 10:58:08 -0000
X-Groupsio-MsgNum: 14025
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 10, 2011 at 12:30:58AM +0100, Wolfgang Denk wrote:
> Dear Martin Jansa,
>=20
> In message <20111209080731.GB3848@jama.jama.net> you wrote:
> >=20
> > On Fri, Dec 09, 2011 at 08:55:05AM +0100, Anders Darander wrote:
> > > * Frans Meulenbroeks <fransmeulenbroeks@gmail.com> [111209 08:25]:
> > >=20
> > > > recipe dirs normally have the name of the (main) package and the of=
ficial name is u-boot
> > >=20
> > > From this I guess that there aren't any other changes in the patch,
> > > apart from the renames?
> > >=20
> > > Next time, could you add '-M' to `git format-patch`, to make git dete=
ct
> > > renames? That results in smaller and easier to review patches.
> >
> > Just because of "Coordinating inter-layer dependencies" thread I have to
> > say, that this will break parsing for people using ie meta-openmoko and
> > meta-nokia BSP layers:
> >
> > meta-nokia/recipes-bsp/uboot/u-boot_git.bb:require recipes-bsp/uboot/u-=
boot> .inc
> > meta-openmoko/recipes-bsp/uboot/u-boot_git.bb:require recipes-bsp/uboot=
/u-b> oot.inc
> >
> > But I'll try to update meta-smartphone layers as soon as this change is
> > applied in oe-core..
> >
> > meta-ti is already using recipes-bsp/u-boot so I guess it's worth
> > renaming.
>=20
> It's highly advisable to perform the rename ASAP. There is an
> Austrian lawyer who claims to have IP rights on the name "uboot".
>=20
> We had to sign a Cease and Desist Notice and update all web pages to
> change all ocurrences of "uboot" into "u-boot" (which actually
> required extensions to the wiki we used).

OK thanks for info, renamed in meta-smartphone and shr branches.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk7jOZQACgkQN1Ujt2V2gBxF9gCeLcpkVilqn/BlMiY86zP1jly+
zzQAoKgcrb6QNk+bRdSwL2QEzf1UHd1e
=rrHC
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
