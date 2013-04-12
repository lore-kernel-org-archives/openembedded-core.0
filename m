Received: from mail-pb0-f50.google.com ([209.85.160.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UQkau-0005Bm-Ng
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 22:29:20 +0200
Received: by mail-pb0-f50.google.com with SMTP id jt11so1598069pbb.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 13:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=/502yzFDrJQTT0IInnU1RudMSDo00NTzJxMbk2kQbxM=;
	b=eB7NL2l9YSRq916RSLlAvBTcQpgqhJp+o9J/p/TMW3Xuqgr3nHk+86TetNkxy2t8v+
	sjkBQliHFonOY7XcX5OeKhq+0OIZ5U6glVU3l09NTDiBEOhnisPRE0goWSnFBsYJqYlS
	iLyocjT+YhIY18SmKscIPxXsjvG1Tsy5YqgDdg0FckC1ZivV7+MIkTTVhwS2uvwyXNyU
	cgKEyZBxuTF4mOCQP6XASlaKdcTyxOA98wtgl3AyxruR/snBigVmvX0aIzRCZHEK0OWR
	2YRDMCD8EI9F4dzloA9N2AT6FR9IZm2+ZJs0YbhqiD0ocGkOQvps2iXZmhPs74YuRImg
	yDKg==
X-Received: by 10.66.161.33 with SMTP id xp1mr17587121pab.36.1365797507171;
	Fri, 12 Apr 2013 13:11:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id g8sm10823142pae.7.2013.04.12.13.11.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 12 Apr 2013 13:11:46 -0700 (PDT)
Date: Fri, 12 Apr 2013 22:11:40 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20130412201140.GV2477@jama>
References: <1359971830-17441-1-git-send-email-Martin.Jansa@gmail.com>
	<1359980304.14071.154.camel@ted> <20130303005928.GA3285@jama>
MIME-Version: 1.0
In-Reply-To: <20130303005928.GA3285@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] qemu.inc: depend on qemu-native only with runqemu DISTRO_FEATURE
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
X-List-Received-Date: Fri, 12 Apr 2013 20:29:23 -0000
X-Groupsio-MsgNum: 37845
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qxpYSgLynlcP4boX"
Content-Disposition: inline

--qxpYSgLynlcP4boX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2013 at 01:59:28AM +0100, Martin Jansa wrote:
> On Mon, Feb 04, 2013 at 12:18:24PM +0000, Richard Purdie wrote:
> > On Mon, 2013-02-04 at 10:57 +0100, Martin Jansa wrote:
> > > * qemu images are usefull even without qemu installed on build machin=
e.
> > >   Some people are building on one machine, but then downloading images
> > >   somewhere else to test them.
> > > * use new "runqemu" DISTRO_FEATURE and BACKFILL it so the behavior st=
ays
> > >   the same, unless disabled by DISTRO_FEATURES_BACKFILL_CONSIDERED
> >=20
> > Using DISTRO_FEATURES for this is nasty since if you change this item,
> > the sstate cache is invalidated. Its really a build configuration level
> > thing, not a distro feature...
> >=20
> > So whilst I appreciate the reasoning for it, I don't think its the right
> > approach and we'll need to find another one.
>=20
> What about removing this completely and adding check in runqemu script
> to say that qemu-native wasn't built?

Or using IMAGETEST variable?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qxpYSgLynlcP4boX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFoanwACgkQN1Ujt2V2gByc8ACfRgfOeWctn7JG9nodFqFXXFi1
fZgAnjfCOz2SkjjGrmS/bvn7pR0M4wi6
=v5mp
-----END PGP SIGNATURE-----

--qxpYSgLynlcP4boX--
