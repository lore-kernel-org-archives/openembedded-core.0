Received: from mail-pb0-f48.google.com ([209.85.160.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UKt9s-0005d5-O5
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Mar 2013 17:25:26 +0100
Received: by mail-pb0-f48.google.com with SMTP id wy12so5299278pbc.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2013 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LSIvNcktVIKhFTAlj61w32MvXzhflc6bKoRHuCy7YpM=;
	b=RaZMARXsmGZpotg2HYkXlcBHHVd/iATPGynKJMErwmBH4rPCaxfp0q6F7B5fWJtOwj
	sIcvpkZOTeeKJU5z627oSiLh/1zLQOX59dVlTUdqVgg5gkl7ppJPgm57SEs0BIGqmyn2
	uf5HXHd3lwLgyA7u/Xpg6BHDntjiFf7OF1iTsyfkSAaMWPsCSrJ1ybspPheEvR+Im7SZ
	/jOUsT39jlPuW3GsPV+mQpJZ59uJE3qMvWNc3zd4uPQCyZwikeD/Nr4Q2CdRtqizV9L1
	0ToeDqDWm846MMW4aOmpeFb6L2RRUlkBrgJQUWUoGsk/f3JzuWW/K5xkA6JILIcH2LH9
	zYkQ==
X-Received: by 10.68.134.38 with SMTP id ph6mr29513947pbb.205.1364400482777;
	Wed, 27 Mar 2013 09:08:02 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id wi7sm23916585pac.9.2013.03.27.09.07.59
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 27 Mar 2013 09:08:01 -0700 (PDT)
Date: Wed, 27 Mar 2013 17:07:52 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20130327160752.GB3254@jama>
References: <1364386111-1734-1-git-send-email-ross.burton@intel.com>
	<5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <5695994C-BB2C-427C-A551-1EA6D4C2AD9D@dominion.thruhere.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Upgrade to 198
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
X-List-Received-Date: Wed, 27 Mar 2013 16:25:37 -0000
X-Groupsio-MsgNum: 37166
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline

--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 27, 2013 at 04:03:31PM +0100, Koen Kooi wrote:
>=20
> Op 27 mrt. 2013, om 13:08 heeft Ross Burton <ross.burton@intel.com> het v=
olgende geschreven:
>=20
> > From: Khem Raj <raj.khem@gmail.com>
> >=20
> > Tested on ppc and x86_64
> > compile tested for uclibc
> >=20
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>=20
> Since 199 has been released a few days back, how about upgrading to that =
and drag in http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D94243e=
f299425d6c7089a7a05c48c9bb8f6cf3da ?
>=20

also "systemd-journal" group should be created to get rid of
systemd-journald[44]: Failed to resolve 'systemd-journal' group: No such pr=
ocess

I guess that SIGUSR1 is expected (I got this even after creating that
group):
systemd-journald[44]: Received SIGUSR1

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFTGVgACgkQN1Ujt2V2gByOnACeNAnMRH2rjj1YfABvm+bLzoya
ApkAoJHIonKaPCWO+krDlcYs77u78tTj
=Jcb1
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
