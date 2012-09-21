Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TF5C4-0004tu-HW
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Sep 2012 17:31:04 +0200
Received: by wgbdq11 with SMTP id dq11so2381533wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2012 08:18:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2UBjfvhDaoxLythiZmldM88Q6aKwE1DGGHBggNJ0pMs=;
	b=scPm/NSsjYK/5iHQIBoTDsm5Ym8jrN5HqGE+rDvaOZ4ayW6devPcmG401kHNU7aHGw
	RiOHAjomcprnmXL9UZ2X4RQbdYVu/JTJ/Ox+C4T3oIDMcmtGDsYgAIzN5KDfrSKFXhtQ
	zd4RzdInZmL6RsY9CzCnasVtG0/Qcrx2SD2jnLkKdKZQHCyFsMss6RDom26TybMxPGP3
	mVJ47RlfkbHlx1kwI9LYts+sAbyTRaSdC7N3xWAW+JeNLyT6lT46rKTqkUGZdekor7c1
	SNM/HZUzZATBldgJ3X43eeKil9xJkJATxglMqKozeuWL7lOnPqpcL9w9HMtJQ7M7LFnp
	NorA==
Received: by 10.216.137.193 with SMTP id y43mr2685881wei.71.1348240700659;
	Fri, 21 Sep 2012 08:18:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id el6sm38310342wib.8.2012.09.21.08.18.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Sep 2012 08:18:19 -0700 (PDT)
Date: Fri, 21 Sep 2012 17:18:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20120921151817.GG10268@jama.jama.net>
References: <1348237488.10108.83.camel@ted>
	<1348237670.15074.234.camel@phil-desktop>
MIME-Version: 1.0
In-Reply-To: <1348237670.15074.234.camel@phil-desktop>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Change WORKDIR to split by PN and version into seperate directories
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
X-List-Received-Date: Fri, 21 Sep 2012 15:31:04 -0000
X-Groupsio-MsgNum: 29646
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kadn00tgSopKmJ1H"
Content-Disposition: inline

--kadn00tgSopKmJ1H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 21, 2012 at 03:27:48PM +0100, Phil Blundell wrote:
> On Fri, 2012-09-21 at 15:24 +0100, Richard Purdie wrote:
> > As per the previous patch, this is really a request for comments, I can
> > see pros and cons...
>=20
> I've been using this configuration locally for quite some time (it's
> needed for rm_old_works in particular) and it seems to be an improvement
> in general.

Last time I was using rm_old_works without this change
https://github.com/shr-distribution/meta-smartphone/commit/0d4c17de1ba7343d=
82bb10c311754e29d573c485

I've seen a lot of /usr/src/debug/${EXTENDPE}${PV}-${PR}" on target from
-dbg packages, which doesn't look right, was this fixed in whatever packs=
=20
source code to -dbg packages?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kadn00tgSopKmJ1H
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBchTkACgkQN1Ujt2V2gBzq8ACgjEAB6wS3Lei0RoLObKkUusbR
Us4AoKz2tL91KVY097d3S9V4CxdD44PG
=bVW/
-----END PGP SIGNATURE-----

--kadn00tgSopKmJ1H--
