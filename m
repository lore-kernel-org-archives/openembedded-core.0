Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGqzo-0008JU-Bj
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:45:44 +0200
Received: by wgbdq11 with SMTP id dq11so395088wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=oqxi9mXFRXcB9VQG1d3aSvi9n2A5bNRLOAV3RH4QF+w=;
	b=AU9Tdv+tBjAFQrgCqXzQR3rwuDVecv9F5SWXyPFJKK2U/jrRGQ+c+j+Br3vUAMPyBn
	5AQpl7wu85mjQwuG4FCbdQurFapMSPvJ+WWD40UR4lb/zAUvvY3FWRtercHQ2GGC8Vt7
	GjT2inCeC6dxhwif/NPFmNCq0kzGEXrm9J7FsVf5uZlS1UQc7MKTOn8xtqojG4ZUbXua
	g/SI2i2DIIZvPtaqL1BAswrwvd+GZukefyHg1MWI3Z0lUSQK50c1lI4uCZu7MDCKlk2i
	L82ApdBPuIxuyVDsXxajv0ovLwCZRrzCgliNh75WUkzroSPZh3X5fPFP/VglRERBeDhV
	8cRQ==
Received: by 10.180.104.197 with SMTP id gg5mr1192721wib.9.1348662771233;
	Wed, 26 Sep 2012 05:32:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f10sm6622096wiy.9.2012.09.26.05.32.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 05:32:50 -0700 (PDT)
Date: Wed, 26 Sep 2012 14:32:57 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20120926123257.GK3313@jama.jama.net>
References: <1348659245-14209-1-git-send-email-paul.eggleton@linux.intel.com>
	<20120926113818.GG3313@jama.jama.net> <2280743.CHvCEmHVFs@helios>
MIME-Version: 1.0
In-Reply-To: <2280743.CHvCEmHVFs@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: make pulseaudio support dependent on DISTRO_FEATURES
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
X-List-Received-Date: Wed, 26 Sep 2012 12:45:44 -0000
X-Groupsio-MsgNum: 29914
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kswDJesP0akhmDn8"
Content-Disposition: inline

--kswDJesP0akhmDn8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 01:31:10PM +0100, Paul Eggleton wrote:
> On Wednesday 26 September 2012 13:38:19 Martin Jansa wrote:
> > On Wed, Sep 26, 2012 at 12:34:05PM +0100, Paul Eggleton wrote:
> > > This should be no change to the previous situation unless you
> > > explicitly have pulseaudio in DISTRO_FEATURES_BACKFILL_CONSIDERED
> > > (currently).
> >=20
> > Why not use PACKAGECONFIG for this?
>=20
> Only because I didn't see the need complicate it just to be able to confi=
gure=20
> it on a per-recipe basis - you almost certainly want pulseaudio either on=
 or=20
> off everywhere. If you want it for stylistic reasons, sure, I guess... it=
 is a=20
> bit ugly though.

Well it looked to me like ideal use-case for PACKAGECONFIG.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kswDJesP0akhmDn8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBi9fkACgkQN1Ujt2V2gBzMvACgrqchDq9hBwH+ESBKOdAiTYT5
6D8AnAyF8svV+v3dq2cG8ur7jGTgGzEC
=VytJ
-----END PGP SIGNATURE-----

--kswDJesP0akhmDn8--
