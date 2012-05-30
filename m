Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SZiET-0004oL-Jf
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 14:42:34 +0200
Received: by wibhm14 with SMTP id hm14so3317267wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 05:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=X6zLk56gpMxWerp/2e/MAAGCIfgSwl0l2weZRDcgWrs=;
	b=VnrQTvchpaYxNs3zYImM/LghvfQBo+yGh7mUyfBBnkFKIl0rX64xYqTQ+fDnAwc5J6
	6ilLQiOdXQsQk7M74Jz/onzW3nLRlFjvid+g8bq8SFS2SPMBAUlpbW74SfEvf2OKusmV
	APaUC98QePGLhnegKoeTC71MA6YOgTRtmelAN9etvGzRptM9HRRyFxriWO1d9FNQ+t6z
	z7xBhPYowWIPogsN4ZI1qdPBZ/wh/X1GmKlY2SCrI8cAUG6VEYTJtbEJ07pzpKyAsZWh
	qjeLpc2QhdabJkaDAE2+vgaEizZEJN6xabiht2l93PzWBFlA+vYQtJk1rDzLGjkLScyt
	740w==
Received: by 10.216.228.29 with SMTP id e29mr1570342weq.153.1338381135223;
	Wed, 30 May 2012 05:32:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id j4sm35014838wiz.1.2012.05.30.05.32.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 05:32:13 -0700 (PDT)
Date: Wed, 30 May 2012 14:32:23 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120530123223.GN3138@jama.jama.net>
References: <20120530110550.04FA710217@opal>
	<20120530120443.GL3138@jama.jama.net>
	<D7D76DF4-C742-4406-A2AA-E206D1D1A00B@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <D7D76DF4-C742-4406-A2AA-E206D1D1A00B@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 12:42:34 -0000
X-Groupsio-MsgNum: 22963
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fpolVoprVozDR81Y"
Content-Disposition: inline

--fpolVoprVozDR81Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 02:21:38PM +0200, Koen Kooi wrote:
>=20
> Op 30 mei 2012, om 14:04 heeft Martin Jansa het volgende geschreven:
>=20
> > On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: da98266f3a228cf65f279db9810a5326c8bd5422
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3Dda98266f3a228cf65f279db9810a5326c8bd5422
> >>=20
> >> Author: Valentin Popa <valentin.popa@intel.com>
> >> Date:   Wed May 23 14:08:58 2012 +0300
> >>=20
> >> xz: updated to version 5.1.1alpha
> >=20
> > this upgrade is causing liblzma package name change
> > -liblzma5_5.0.3-r1_armv4te.ipk
> > +liblzma_5.1.1alpha-r0_armv4t.ipk
> >=20
> > so all packages which rdepends on liblzma should get PR bump, e.g.:
> > *libsystemd-journal0
> > *libpoppler18
> > *libsdl-image-1.2-0
> > *libpoppler-glib8
> > *systemd
> > *ethumb
> > *libtiff5
> > *epdf
>=20
> I'd advocate fixing the FILES_* variables to put only the liblzma.so.x in=
 the liblzma subpackage and bump PR if it's still needed.

That was first what I've checked and there is still just .so + link

OE @ ~/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/xz/xz-5.1.1alpha-r=
0 $ find packages-split/liblzma
packages-split/liblzma
packages-split/liblzma/usr
packages-split/liblzma/usr/lib
packages-split/liblzma/usr/lib/liblzma.so.5
packages-split/liblzma/usr/lib/liblzma.so.5.0.99

But later I've found that whole debian.bbclass is broken.. see my other rep=
ly in this thread..

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fpolVoprVozDR81Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/GE1cACgkQN1Ujt2V2gBwfMACfXpoBZECdR/R2SbKKmJ1gfI2s
LjYAoLv1gAEv+muuH0fQZneRo2DblkzJ
=eCfU
-----END PGP SIGNATURE-----

--fpolVoprVozDR81Y--
