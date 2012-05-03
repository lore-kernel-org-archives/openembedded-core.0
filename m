Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SPotK-0006Sc-6d
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 07:47:50 +0200
Received: by wera1 with SMTP id a1so991702wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 May 2012 22:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=wPUhHZSPLr+Bxt9n5+Cmt/YhPIoyJ7iVWJGUob8PGm0=;
	b=seRUWkj60xAP675T9E3jBUF7Dyx4b8qb3B+ioMix51f+VYX9IG4TLhIb8uSBJ8Y3ZJ
	1J2PZp/A48v28AZOrBD3fyod05M4IYZoEyS3rniPRZUHeBJJDmc/lxBCR6o/gPF9OLMb
	0RY8T6EbJEhbHGVlKPYR3DQzjKxQCmqNnxB7YAUb1ETmjxvJauqrU1dPAFuBbaAE6PMD
	Gw/490hW3NWQLXxvpgZhTPyjrD+fXEm87brrwJ8rPhwhjwUmQbIlHUDYqIPPxbyZGhZE
	x79Vb8JFdY/m5wtDTSOLZZpkViMv6PkbnG3PBCChqz9i/B/jhUg0UA7iui7moDlVZLKz
	HPKg==
Received: by 10.180.81.135 with SMTP id a7mr20579826wiy.16.1336023485196;
	Wed, 02 May 2012 22:38:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k6sm49257578wie.9.2012.05.02.22.38.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 02 May 2012 22:38:04 -0700 (PDT)
Date: Thu, 3 May 2012 07:38:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120503053806.GC4658@jama.jama.net>
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4FA1A25F.9030502@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 05:47:50 -0000
X-Groupsio-MsgNum: 21551
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline

--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 02, 2012 at 02:08:47PM -0700, Khem Raj wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 05/02/2012 07:09 AM, Martin Jansa wrote:
> > On Wed, May 02, 2012 at 03:59:45PM +0200, Martin Jansa wrote:
> >> From: Tomas Frydrych <tomas@sleepfive.com>
> >>=20
> >> These are required to build recent versions of glib-2.0
> >=20
> > similar patch is needed also for other site files, just noticed it
> > while building for qemux86-64
>=20
> would you also include rest of architectures too please ?

I did for x86 and x86-64, for the rest I don't know the right values or
care enough to find them somewhere.

Cheers,

>=20
> >=20
> >>=20
> >> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com> ---=20
> >> meta/site/arm-common |    3 +++ 1 files changed, 3 insertions(+),
> >> 0 deletions(-)
> >>=20
> >> diff --git a/meta/site/arm-common b/meta/site/arm-common index
> >> c3ffe08..cad8027 100644 --- a/meta/site/arm-common +++
> >> b/meta/site/arm-common @@ -76,6 +76,9 @@
> >> glib_cv_sizeof_ptrdiff_t=3D${glib_cv_sizeof_ptrdiff_t=3D4}=20
> >> glib_cv_sizeof_size_t=3D${glib_cv_sizeof_size_t=3D4}=20
> >> glib_cv_sizeof_system_thread=3D${glib_cv_sizeof_system_thread=3D4}=20
> >> glib_cv_sys_use_pid_niceness_surrogate=3D${glib_cv_sys_use_pid_nicenes=
s_surrogate=3Dyes}
> >>
> >>=20
> +ac_cv_alignof_guint32=3D4
> >> +ac_cv_alignof_guint64=3D8 +ac_cv_alignof_unsigned_long=3D4
> >>=20
> >> #gstreamer as_cv_unaligned_access=3D${as_cv_unaligned_access=3Dno} --
> >>  1.7.8.6
> >>=20
> >=20
> >=20
> >=20
> > _______________________________________________ Openembedded-core
> > mailing list Openembedded-core@lists.openembedded.org=20
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>=20
> iEYEARECAAYFAk+hol8ACgkQuwUzVZGdMxQEkgCfZY5mVAR5RxST2olpH41m6V+d
> iQwAnRBaSrzbM/RGWmb8cZJjXwMAg6KJ
> =3DtUvc
> -----END PGP SIGNATURE-----
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+iGb4ACgkQN1Ujt2V2gBwD4QCgq+fwwHc+uN/Cwey8cFu82X6T
PHIAoLD0X8hWWM7K0ChIl1on3scvx3z2
=9uaM
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
