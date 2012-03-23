Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SB13f-0006CM-3d
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 10:45:19 +0100
Received: by wera1 with SMTP id a1so2512507wer.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 02:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=xYU46m+chN/7qWfQs9gosqOvRQvN+pSKWHc8vZ8fEhM=;
	b=lub1YL2FEU3ccE8LAQ56a1p8hgB+4rGs1AMPpaCZMozYDYiTiav1769D4oeZ7U+Sjk
	ukt41UogIFPZYmeJ3ZLnh9h1iZNGw/91D1R0TSgUkgEpVz838ogpsmX4w4G4hQV1ezth
	Z/cWzmIQHAozf8eCl2Y6NAgzVFTeLjMFzVYxjgopftzIOAF4dW/aevimroqdc0BPBqz3
	5kWLxMaUTzgBlKDwVGi/jKsCwOFHZCC3W3JtqtmmoNrJow5p5nufAUtuJeKEuhSw45VN
	sZgoUf4eNVZQ2yQulNm38QXbKYHMHzroLtHFaX6zWFqgU1kzMFExeY9a8G3acKREN2z8
	pXKQ==
Received: by 10.180.85.70 with SMTP id f6mr4949070wiz.5.1332495383165;
	Fri, 23 Mar 2012 02:36:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm12429384wiy.7.2012.03.23.02.36.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 02:36:22 -0700 (PDT)
Date: Fri, 23 Mar 2012 10:36:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120323093623.GB3879@jama.jama.net>
References: <1332485029-9148-1-git-send-email-Martin.Jansa@gmail.com>
	<1332494193.9740.382.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1332494193.9740.382.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] kernel.bbclass: populate /etc/modules-load.d/ with module_autoload entries too
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
X-List-Received-Date: Fri, 23 Mar 2012 09:45:19 -0000
X-Groupsio-MsgNum: 19515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline

--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 23, 2012 at 09:16:33AM +0000, Richard Purdie wrote:
> On Fri, 2012-03-23 at 07:43 +0100, Martin Jansa wrote:
> > * /etc/modules-load.d/foo.conf is used by systemd like /etc/modutils/fo=
o was with sysvinit
> >=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/classes/kernel.bbclass |   10 ++++++++--
> >  1 files changed, 8 insertions(+), 2 deletions(-)
>=20
> Since these look identical couldn't we symlink them? I'm not a big fan
> of writing duplicate data to a package :/.

OK I'll change it in v2

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9sRBcACgkQN1Ujt2V2gBw6RwCfQjwr3LzbQMWK/JnCBXaDqgBX
HCQAoJ9Yzi2/gDajq8AMJTBsGmi1HTeg
=h8xz
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--
