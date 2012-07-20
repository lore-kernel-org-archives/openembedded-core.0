Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SsAov-0003zV-UQ
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:52:29 +0200
Received: by weyr6 with SMTP id r6so2411439wey.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 03:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZPAeO/WAlUjRNvEDuNWiBNScYjil+y8/F/eb5GyOwuM=;
	b=aJeIduWyIYB8d/8cPv3SH0TXkM0X+k9ixqb39LsPgkSrbzQ7/6gGqgyhJkweItBfqd
	jO7SZI2IlnmdvRPhjhtkQR0tfAbb7xNxcOtWLdxanzORjcVoEIiIFVIM1tXY813NJkAn
	LSDrD2imLh/Xb8ABoAL79tM7SW7/q/dds2R/KyYv1H7afiLxyeQK9MZ3yaFLorpW5FsB
	xDavDU5pbWA/nb24DLr73+qEGFyPlmj0kPB+j7S3FBW6LmCKrWW91Fzf3ZS4zknHzHBw
	tDBfhBO/1VFm+sC7UQl+ohMWyGC5iW7NBiQ8509jU1t7qONU3MW7J56sN9B010UWS8LK
	ny0A==
Received: by 10.180.83.106 with SMTP id p10mr24626388wiy.21.1342780866892;
	Fri, 20 Jul 2012 03:41:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eu4sm43913739wib.2.2012.07.20.03.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jul 2012 03:41:04 -0700 (PDT)
Date: Fri, 20 Jul 2012 12:41:17 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120720104117.GE3534@jama.jama.net>
References: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lyk3xy7mlu.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: Broken parallel build of gcc*
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
X-List-Received-Date: Fri, 20 Jul 2012 10:52:30 -0000
X-Groupsio-MsgNum: 25843
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k3qmt+ucFURmlhDS"
Content-Disposition: inline

--k3qmt+ucFURmlhDS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2012 at 12:28:29PM +0200, Enrico Scholz wrote:
> Hi,
>=20
> some of the recent changes seem to break the parallel build of the gcc*
> recipes which are sharing a same source directory:
>=20
> | $ ./bitbake gcc-cross-initial gcc-cross-intermediate gcc-cross -c clean=
sstate
> | $ BB_NUMBER_THREADS=3D3 ./bitbake gcc-cross-initial gcc-cross-intermedi=
ate gcc-cross
> | ...
> | NOTE: package gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d218387=
95349faab5dede-r7: task do_unpack: Started
> | NOTE: package gcc-cross-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faa=
b5dede-r7: task do_unpack: Started
> | NOTE: package gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d218387=
95349faab5dede-r7: task do_unpack: Succeeded
> | ERROR: Error executing a python function in ...recipes-devtools/gcc/gcc=
-cross_4.7.bb:
> | OSError: [Errno 39] Directory not empty: '...tmp/work-shared/gcc-4.7.1.=
0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r7/git/'
> | NOTE: package gcc-cross-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faa=
b5dede-r7: task do_unpack: Failed
>=20
> It seems that the work-shared/ directory is not locked and cleaned when
> starting the second unpack.

I can confirm the same
http://lists.linuxtogo.org/pipermail/openembedded-core/2012-July/026174.html

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k3qmt+ucFURmlhDS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAJNc0ACgkQN1Ujt2V2gBySUgCgk8H7fN24DdotMGYNnP60YNMa
C2sAoJ7s3zSUP8YFjkodGQTpgNMMsI3z
=4dht
-----END PGP SIGNATURE-----

--k3qmt+ucFURmlhDS--
