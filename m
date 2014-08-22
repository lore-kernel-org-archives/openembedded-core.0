Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f170.google.com (mail-we0-f170.google.com
	[74.125.82.170])
	by mail.openembedded.org (Postfix) with ESMTP id D129B65DD0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 19:39:06 +0000 (UTC)
Received: by mail-we0-f170.google.com with SMTP id w62so11053944wes.29
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 12:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Wno7mdyMDULmMI4YQ1851A18V+RDaUBc2CuGovLDTcU=;
	b=uPmBmjJkNrFdeAM/J8+9QOFWZeKDGnCIJTAjb+kmkoc5n6omY6H5gkVJXyCww0JHe+
	PoMqJHMwaVtGnjYKrj6aDpNiQXQmvIqTJE73vF5aR/VjcZ90Vr5bpFQX3wv/XUWRWy8L
	HsuHZpwa7wOuUgGQMzldIN3ZmbkxT8xtL+J3hPXHmBaq45P58+/xdg/Wz9K9zLwTQzzx
	jyx3FDX0YUalH8yI8O2BV+Kz09EFJ6yEa95SvIj0tE5uB6sn4Yt+fYeGnsuUVM1PBXFi
	dpgyjCUZfujyON4yvAQUqWJ1OIIr7yhCKkubF24lDD2dPC08dnecSFpviF3rBhZhG1aZ
	QzRw==
X-Received: by 10.180.21.141 with SMTP id v13mr529743wie.48.1408736346703;
	Fri, 22 Aug 2014 12:39:06 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	um5sm29305505wjc.3.2014.08.22.12.39.05 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Aug 2014 12:39:05 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 22 Aug 2014 21:39:10 +0200
To: Peter Seebach <peter.seebach@windriver.com>
Message-ID: <20140822193910.GD20524@jama>
References: <cover.1408649791.git.peter.seebach@windriver.com>
	<53F77370.2060603@balister.org> <20140822133349.76751634@e6410-2>
MIME-Version: 1.0
In-Reply-To: <20140822133349.76751634@e6410-2>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Change default for cortexa* to armv7at-neon.
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
X-List-Received-Date: Fri, 22 Aug 2014 19:39:08 -0000
X-Groupsio-MsgNum: 56847
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="d8Lz2Tf5e5STOWUP"
Content-Disposition: inline

--d8Lz2Tf5e5STOWUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 22, 2014 at 01:33:49PM -0500, Peter Seebach wrote:
> On Fri, 22 Aug 2014 10:44:32 -0600
> Philip Balister <philip@balister.org> wrote:
>=20
> > Can we also move to hard float abi?
>=20
> I'd rather not, just because the reason I care about this at all is that =
our
> prebuilt toolchain has a set of binaries for armv7at-neon, but not for ha=
rd
> float ABI.
>=20
> I am reminded, though, of a question I had about all the cortex tunings:
>=20
> Why do they set DEFAULTTUNE to a tuning that isn't one of the ones using =
the
> new features they define?

Because it's always compromise between optimizing for given device and
sharing the same DEFAULTTUNE (and its binary feed) for many MACHINEs suppor=
ted
by DISTRO.

Even enabling thumb seems wrong, because ARM_INSTRUCTION_SET is arm by
default, so this change is only renaming the feed, but still building
the same binaries (unless distro sets ARM_INSTRUCTION_SET).

Please check this old RFC for more details:
https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg28=
907.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--d8Lz2Tf5e5STOWUP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlP3nF4ACgkQN1Ujt2V2gByDEgCfdhBWiP0bSnbKmpfjaXqOJ5Cn
VEoAoLjjzemKTKNN+hWb6Q4zl4bhZOgr
=oMRf
-----END PGP SIGNATURE-----

--d8Lz2Tf5e5STOWUP--
