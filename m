Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 47A1D73D3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 16:28:24 +0000 (UTC)
Received: by widdi4 with SMTP id di4so80034409wid.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Apr 2015 09:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=VudfUPN9Zm9a9gRL4g4BhTwLIuuut1VafIUoJeFUPIA=;
	b=i/kwqzKOVYMEy9K0YnbiwpNk9l+Hy0SgAIrVMn9OQC9e8ODqDQLP0bog9GrHislu0X
	8hOzzf5YdbZSD82ukGHEB0f/fXTv+YQdTKAIi0EoFbVS2peW7od9ZlgnRpjTH8a3r9Vu
	NCHjVBFFjwZwg57C30bXnQZMwtE2L4PEeKGISRe89rXVt2Ou8yBGaYcdp192x+WtkWj1
	Y7qabFcCCtfkmqUsvdqQMBfLgfanlfxZ9FiBXZA8eBBmnwdSG30b7R/UeYs3NKxhqXmr
	I03z9cGH3qW3jW9sJiY1R9BQnXtjUhztYyXNTS5O5c/uo0OqvPoZNqmEL9yCZEAxPeAP
	rMiA==
X-Received: by 10.180.76.137 with SMTP id k9mr22606943wiw.4.1428942505117;
	Mon, 13 Apr 2015 09:28:25 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id fo7sm12193725wic.1.2015.04.13.09.28.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Apr 2015 09:28:24 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 13 Apr 2015 18:28:28 +0200
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20150413162828.GJ2330@jama>
References: <cover.1428939870.git.paul.eggleton@linux.intel.com>
	<abe2d51f35b85dcbbd43c61d9309bfd7e38d3244.1428939870.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <abe2d51f35b85dcbbd43c61d9309bfd7e38d3244.1428939870.git.paul.eggleton@linux.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] classes/package: clarify installed-vs-shipped message
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
X-List-Received-Date: Mon, 13 Apr 2015 16:28:26 -0000
X-Groupsio-MsgNum: 64317
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1ou9v+QBCNysIXaH"
Content-Disposition: inline

--1ou9v+QBCNysIXaH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2015 at 04:44:52PM +0100, Paul Eggleton wrote:
> Based on the number of times I've had to explain it over the years it
> seems that a lot of new users don't immediately realise what is meant
> by "shipped" here (nor should we expect them to) so let's at least
> mention packaging and briefly tell the user what they need to do. (I was
> going to go into more detail in the message, but there is really more
> detail than can be covered succinctly here.)
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/package.bbclass | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 5558d0d..9790e9d 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1132,12 +1132,13 @@ python populate_packages () {
>                  unshipped.append(path)
> =20
>      if unshipped !=3D []:
> -        msg =3D pn + ": Files/directories were installed but not shipped"
> +        msg =3D pn + ": Files/directories were installed but not shipped=
 in any package:"
>          if "installed-vs-shipped" in (d.getVar('INSANE_SKIP_' + pn, True=
) or "").split():
>              bb.note("Package %s skipping QA tests: installed-vs-shipped"=
 % pn)
>          else:
>              for f in unshipped:
>                  msg =3D msg + "\n  " + f
> +            msg =3D msg + "\nPlease either set FILES such that these ite=
ms are packaged, or alternatively delete them within do_install"

We should also mention the possibility to fix Makefile.am,
CMakeLists.txt, ... not to install them in first place.

>              package_qa_handle_error("installed-vs-shipped", msg, d)
>  }
>  populate_packages[dirs] =3D "${D}"
> --=20
> 2.1.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1ou9v+QBCNysIXaH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUr7qwACgkQN1Ujt2V2gBzSUwCfYut/k9aVE7Pd8Cu16se86OR3
T+8An0Go5aStzneoXCZcwuhQ10QuE0h0
=d0YK
-----END PGP SIGNATURE-----

--1ou9v+QBCNysIXaH--
