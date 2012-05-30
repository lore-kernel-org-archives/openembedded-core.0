Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1SZixB-0005PU-4U; Wed, 30 May 2012 15:28:48 +0200
Received: by werg55 with SMTP id g55so3476579wer.6
	for <multiple recipients>; Wed, 30 May 2012 06:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=eGDEIT0tNi2vVUcR0WornBwoVAzzh9gNPDJZNwj5f4Y=;
	b=nXFJRdHHZs3AU2ptxpKCTNxrITKD4HLAkUaNo4Gi2OkgVozLsRjIASXtnWnZj0aptq
	qzh5OV8YJG+RqdrrhFPvmSPdRwSJhwH0NWWta3LwR2xUonYPz2LD4QmXbi+BKEXOCJJ3
	ruXNj2YBj5rth0BX9AZk4tuSIAoDgh6MqHGc44PylsGMFfrGgerWGvdQa4ApGj/PgEAN
	rqRIrq1ISz2e+2PJNIVTJ6d9QrS+uFOk0Q8TlAvehlsLPR6n7bqKKJnugKBkJmKeC1EA
	7HlGIJ/oRsKZXOZ2mJO9DyugXGEL4Q3CFQNAGSU/ETNNtgGXqdACs5bxpx4/pr2NRN0J
	qLCw==
Received: by 10.216.150.140 with SMTP id z12mr10374154wej.68.1338383905110;
	Wed, 30 May 2012 06:18:25 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm56414775wib.2.2012.05.30.06.18.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 May 2012 06:18:24 -0700 (PDT)
Date: Wed, 30 May 2012 15:18:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120530131833.GP3138@jama.jama.net>
References: <20120530110550.04FA710217@opal>
	<20120530120443.GL3138@jama.jama.net>
	<20120530122007.GM3138@jama.jama.net>
	<20120530125307.GO3138@jama.jama.net>
	<1338383413.20169.141.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1338383413.20169.141.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: debian.bbclass got broken today Was: [oe-commits] Valentin Popa : xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Wed, 30 May 2012 13:28:48 -0000
X-Groupsio-MsgNum: 22970
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="movZSYdJ761vCHaE"
Content-Disposition: inline

--movZSYdJ761vCHaE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 30, 2012 at 02:10:13PM +0100, Richard Purdie wrote:
> On Wed, 2012-05-30 at 14:53 +0200, Martin Jansa wrote:
> > On Wed, May 30, 2012 at 02:20:07PM +0200, Martin Jansa wrote:
> > > On Wed, May 30, 2012 at 02:04:43PM +0200, Martin Jansa wrote:
> > > > On Wed, May 30, 2012 at 11:05:49AM +0000, git@git.openembedded.org =
wrote:
> > > > > Module: openembedded-core.git
> > > > > Branch: master
> > > > > Commit: da98266f3a228cf65f279db9810a5326c8bd5422
> > > > > URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3Dda98266f3a228cf65f279db9810a5326c8bd5422
> > > > >=20
> > > > > Author: Valentin Popa <valentin.popa@intel.com>
> > > > > Date:   Wed May 23 14:08:58 2012 +0300
> > > > >=20
> > > > > xz: updated to version 5.1.1alpha
> > > >=20
> > > > this upgrade is causing liblzma package name change
> > > > -liblzma5_5.0.3-r1_armv4te.ipk
> > > > +liblzma_5.1.1alpha-r0_armv4t.ipk
> > > >=20
> > > > so all packages which rdepends on liblzma should get PR bump, e.g.:
> > > >  *libsystemd-journal0
> > > >  *libpoppler18
> > > >  *libsdl-image-1.2-0
> > > >  *libpoppler-glib8
> > > >  *systemd
> > > >  *ethumb
> > > >  *libtiff5
> > > >  *epdf
> > > >=20
> > > > Cheers,
> > >=20
> > > Looks like whole debian.bbclass got broken by todays merge in oe-core=
=2E.
> >=20
> > looking at buildhistory
> > http://git.shr-project.org/git/?p=3Dbuildhistory.git;a=3Dcommitdiff;h=
=3D320a9a8a80f0d412cea31a534a8022bacf6545e6#patch330
> >=20
> > it looks like run.package_do_shlibs also doesn't work (all RDEPENDS
> > detected from shlibs are gone), can someone confirm this behavior on=20
> > his system?
>=20
> Yes, its from:
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3D5996b2b58e36864edc=
077326a942795ca12f48da
>=20
> I'm still trying to figure out the best course of action to fix this...

Ah, thanks for info..

so I have reverted all 3 (to be sure) locally and now trying to find and=20
rebuild everything which was built today to get sane feed again.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--movZSYdJ761vCHaE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/GHikACgkQN1Ujt2V2gBySXwCeOd6AgsQKtv73CAQeLOUsjRtN
jzIAn3QRTdBbsk7jzH7Up6oIe5hUEtqK
=xHBg
-----END PGP SIGNATURE-----

--movZSYdJ761vCHaE--
