Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1T6iBB-0001f9-82; Wed, 29 Aug 2012 15:19:33 +0200
Received: by wibhq4 with SMTP id hq4so5208593wib.6
	for <multiple recipients>; Wed, 29 Aug 2012 06:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AgQ9zf7rvyeaIxo9KpSV1+jFH09oHUOZUKDDU+6IkaQ=;
	b=0ijn5rD2w8SnceLtC+in8xiP6rRYFAyu96yNJiOkS9Sw22ymLZLNgj5979Zne9K8zT
	qBslww6AqYqvWkf5YG82c87C/LD4TuQvlNxChHXkBYvbDeQfnFWUzNmYxIrnZDSYjli3
	3rgOWjP7LXk/k9TTU9ORzfQsPMjVT+a6BzXd/2OJHekRHdkfOiii3tWoRZMqvgYBR/UA
	k650dv4BrVhpyZtJuCq+N5YLnx2JhqZ3zbEeVd7gb/z+FrUjbImFU/1uHuiTZFnkkOiz
	eOwUyx787Z98KPSXBPUBF5S0AmtOxPKGf0KyXTqpNxLjQGJXvjeZ3i3V7geLeoB+3YRv
	TnVA==
Received: by 10.216.136.158 with SMTP id w30mr904474wei.136.1346245638836;
	Wed, 29 Aug 2012 06:07:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fb20sm15534397wid.1.2012.08.29.06.07.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 29 Aug 2012 06:07:17 -0700 (PDT)
Date: Wed, 29 Aug 2012 15:07:31 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120829130731.GB3287@jama.jama.net>
References: <897CCE6A-604A-484A-8ACD-452701801FAA@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <897CCE6A-604A-484A-8ACD-452701801FAA@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"<openembedded-core@lists.openembedded.org> oe-core layer"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bitbake distro packages: kill them with fire
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
X-List-Received-Date: Wed, 29 Aug 2012 13:19:33 -0000
X-Groupsio-MsgNum: 28363
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="0ntfKIWw70PvrIHh"
Content-Disposition: inline

--0ntfKIWw70PvrIHh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 29, 2012 at 02:49:53PM +0200, Koen Kooi wrote:
> Hi,
>=20
> These might not be the appropiate lists, but I might reach a few of the c=
ulprits. Over the years people have been doing 'apt get install bitbake' or=
 'make install' to put bitbake into /usr/bin and after a few minutes to get=
 on irc/email/etc to complain that everything is suddenly broken. There are=
 checks for bitbake versions in the metadata, but it can (and will!) still =
break with due to python path nastiness.
>=20
> So to every person packaging bitbake for their distro: stop doing that!
>=20
> If someone has a better suggestion to avoid this problem (more documentat=
ion doesn't work), please speak up.

I was using bitbake from Gentoo for long time (they provide also live
ebuilds) and it worked fine. I was using packaged version mostly to
control which version gets installed to shr-chroot (sometimes with extra
patches, sometimes holding on older version until shr metadata were
compatible).

Now I switched back to bitbake checkout with revision locked by setup
scripts to make life easier for people using my setup scripts but
without shr-chroot option.

So I don't mind if people stop doing bitbake packages :).

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--0ntfKIWw70PvrIHh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlA+FBMACgkQN1Ujt2V2gByLOgCbBq2dU4hdJwjlCHrjIRxyUPwH
Mh8AnAzNvE/XbiK0h50zMN3O8VmTPI06
=41dA
-----END PGP SIGNATURE-----

--0ntfKIWw70PvrIHh--
