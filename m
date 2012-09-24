Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGEX3-0007NE-QC
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Sep 2012 21:41:29 +0200
Received: by wibhn17 with SMTP id hn17so4447245wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2012 12:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=O82ZOwjpIU5BWmWKcaS3htOcMYTCjnDeK2l8fyESgB0=;
	b=B7GwoJGl6m/ac52z+2S4tkG5A7kcmT0IUV3KeULMGqlWDy9LpkzhL432O3IfovF71M
	mtCZaN6mX7x9aZmmnnQCGo27MuLPMUhyzm4QcoQsHy/rUlzS6U2Wjso4KuH3pUllTXjx
	h1txLF7SnoRFpmShkkPt2FiMKxQ8U5Asn2BnKKjW5YnD/nhow6keCag/UhBb6dxP+NRK
	pNZDQRp5HMs9UAUPy+0bGkK2SL7PUFe5zqbupYE0GYtJM0lFgnvic4FA+AVBceGXZ4gC
	FuaFGsSPGw7r5H5ShgmRSf78HxGtgyf+o+nrEUEQmeKPatCQl72otCUMo983e9c1PWCH
	76qw==
Received: by 10.216.232.84 with SMTP id m62mr7456316weq.200.1348514921632;
	Mon, 24 Sep 2012 12:28:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id cw4sm13007986wib.4.2012.09.24.12.28.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 24 Sep 2012 12:28:40 -0700 (PDT)
Date: Mon, 24 Sep 2012 21:28:45 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120924192845.GE3295@jama.jama.net>
References: <1348501103.31293.51.camel@phil-desktop>
	<50607F4E.5040300@linux.intel.com>
	<1348503778.31293.52.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348503778.31293.52.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: work-shared not being correctly shared
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
X-List-Received-Date: Mon, 24 Sep 2012 19:41:29 -0000
X-Groupsio-MsgNum: 29797
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TybLhxa8M7aNoW+V"
Content-Disposition: inline

--TybLhxa8M7aNoW+V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2012 at 05:22:57PM +0100, Phil Blundell wrote:
> On Mon, 2012-09-24 at 08:42 -0700, Saul Wold wrote:
> > Yes, I am seeing something similar with do_patch happening twice on the=
=20
> > work-shared area, I talked with Richard a bit ago about it, and I am=20
> > digging into the siginfo files, you can use bitbake-sigdiff to see what=
=20
> > sigs are changed causing it unpack twice (or in my case patch twice).
>=20
> Ah, right, it seems to be rm_old_work that's causing the problem.  I'll
> disable that for now and figure out how to fix it later.

That was already discussed few weeks ago, you should be able to find it
in archive.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--TybLhxa8M7aNoW+V
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBgtG0ACgkQN1Ujt2V2gBxF/wCgiTM4bj6nDA5bpqmaxMM/K5ys
hJUAoIsRY04WecONKxeEZh58LOC3XE0l
=nWYS
-----END PGP SIGNATURE-----

--TybLhxa8M7aNoW+V--
