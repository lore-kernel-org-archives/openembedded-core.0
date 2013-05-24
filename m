Return-Path: <martin.jansa@gmail.com>
Received: from mail-pb0-f50.google.com (mail-pb0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 963E360974
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 20:48:22 +0000 (UTC)
Received: by mail-pb0-f50.google.com with SMTP id wy17so4671276pbc.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2013 13:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=To7FZ6aFISUXRNk1Tb/IM2LTt/keaBiKh8AJOueZ7R0=;
	b=fLX0I3cP62olesZs/qO9uzwK5Z3IrgK1TGJeLu8FdtwZo4CElWCQVhMpWyMX1DnNwl
	2jvYEBB3MI9Vmh6EyfAdAqJmp5zRW2kGjjurW6bBxVtl01DBkqgZNHInB2ncRf++m4fF
	Z8IwYadSYJuwG5xMvUXIxb10wPfdjoilu+BtVP1YqCb+RCGdjJnvWX4ATNLziWP8Yed/
	FytcE6iZERRwfvePRZwhN6pN3RKfl83L1piYAJQuCQR6jtD7ZEgamv9rfi5SaRZGjVmq
	X9cYJSp/5cvamRaUbWqjSwA7kndWWJzqySTJRQDndoxjs4NxuZ71aYf3lcMc7vZ78USG
	Wlgg==
X-Received: by 10.66.158.101 with SMTP id wt5mr19630574pab.8.1369428503355;
	Fri, 24 May 2013 13:48:23 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	cd2sm17471205pbd.35.2013.05.24.13.48.21 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 24 May 2013 13:48:22 -0700 (PDT)
Date: Fri, 24 May 2013 22:48:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20130524204820.GX32431@jama>
References: <519DD2D2.3010009@intel.com>
	<1369299303-15980-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJTo0Lbw4-fCkk_K4Li8CZ-UsnDBdu9WgH1ByXdGyvfSU7bUPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbw4-fCkk_K4Li8CZ-UsnDBdu9WgH1ByXdGyvfSU7bUPw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] libdrm: fix packaging after last upgrade
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
X-List-Received-Date: Fri, 24 May 2013 20:48:22 -0000
X-Groupsio-MsgNum: 39711
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xd9y+pRso0hzCdjI"
Content-Disposition: inline

--xd9y+pRso0hzCdjI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 23, 2013 at 10:08:23AM +0100, Burton, Ross wrote:
> On 23 May 2013 09:55, Martin Jansa <martin.jansa@gmail.com> wrote:
> > -FILES_${PN}-tests =3D "${bindir}/dr* ${bindir}/mode*"
> > +FILES_${PN}-tests =3D "${bindir}/dr* ${bindir}/mode* ${bindir}/*test"
>=20
> Why not just capture ${bindir}/* and we won't have this problem in the fu=
ture?

No special reason, just kept it as it was introduced in ancient history:
commit 1370ba3fc0b554fd9edd4ede653f7e3e8413ec3d
Author: Richard Purdie <rpurdie@linux.intel.com>
Date:   Tue Apr 21 17:37:39 2009 +0100

    libdrm: Package test utils

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--xd9y+pRso0hzCdjI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGf0hQACgkQN1Ujt2V2gByGBQCgscMWIGre/2WWYdpx/FKXRrEl
R5kAnRTnV3PLIhDffPYITN8KNP9x5+zr
=2cRM
-----END PGP SIGNATURE-----

--xd9y+pRso0hzCdjI--
