Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfXw6-0005Wp-G3
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Dec 2012 16:27:58 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so1166352eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Dec 2012 07:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=kcJDxE0cLJg7J5015ZF4gJ/xz4iueYEzpnbGcVLYOhY=;
	b=UZu8BqEfK4Fv74ITlQWx86mU3LU7WnEAqtexSQOUqB1Ll6+GeGpJlvi8NqqBz3E45E
	L2t0jQ/JIaoACSeC06gK74/KhhXpe5G4OIbX9lBXZ6Bs0s4oIy2iiFB+YPrmAKbvneCR
	LPXQWKNSbnlMiAqodwdYJwYufEvJTMpU/x/gCVnilxbFuizaQn96DB+KCY6/Jve8IlaH
	/V2ojBz83NJ56hXvJHhNbiIU4FLY7qPTZ04Q6MiYD3Wt+e8B8RcjcU/uD1tMQ1utVr8t
	FY4Ymoqe6NyFVVIjrbUq1hnmSBfL4sZslVCfi0Lsg/4rgA4tF/WL0+lQEfEsMgbwT9+Z
	tePw==
Received: by 10.14.178.7 with SMTP id e7mr37300691eem.44.1354547617241;
	Mon, 03 Dec 2012 07:13:37 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id i49sm5128800eem.6.2012.12.03.07.13.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Dec 2012 07:13:36 -0800 (PST)
Date: Mon, 3 Dec 2012 16:13:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20121203151331.GD3354@jama.jama.net>
References: <20121112132247.3BB7D102EC@opal>
MIME-Version: 1.0
In-Reply-To: <20121112132247.3BB7D102EC@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Ross Burton : glib-2.0: upgrade to latest stable, 2.34.1.
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
X-List-Received-Date: Mon, 03 Dec 2012 15:27:58 -0000
X-Groupsio-MsgNum: 32091
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline

--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 12, 2012 at 01:22:47PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: ce5fcad59fff19dbffc2d7b49c0c8bf3701d17ed
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Dce5fcad59fff19dbffc2d7b49c0c8bf3701d17ed
>=20
> Author: Ross Burton <ross.burton@intel.com>
> Date:   Mon Nov  5 16:22:48 2012 +0000
>=20
> glib-2.0: upgrade to latest stable, 2.34.1.
>=20
> Also explicitly disable the test suite (as we can't run it), subsequently
> dropping 60_wait-longer-for-threads-to-die.patch and nodbus.patch.
>=20
> nolibelf.patch has been merged upstream, drop.
>=20
> Upstream has dropped the pre-generated man pages, to generate them again =
we'd
> need libxslt and the DocBook infrastructure.  We can live without the man=
 pages
> as those build-dependencies are non-trivial.

openembedded-core/meta/recipes-multimedia/gstreamer/gst-openmax_0.10.1.bb

is not compatible with this glib version

gstomx_base_filter.c:846:3: error: 'g_mutex_new' is deprecated
(declared at
/OE/jansa-test/shr-core/tmp-eglibc/sysroots/tuna/usr/include/glib-2.0/glib/=
deprecated/gthread.h:271)
[-Werror=3Ddeprecated-declarations]

Can you check that?

Cheers,

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlC8wZsACgkQN1Ujt2V2gBxBaACeNX3uwoe3lsB/FrT0fUI1UddY
FDcAn3QZgPPWnCEOEIUX0AOse5iHE7lJ
=wiek
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
