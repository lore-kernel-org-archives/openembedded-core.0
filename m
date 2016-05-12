Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f195.google.com (mail-lb0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 433E56FFC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:16:03 +0000 (UTC)
Received: by mail-lb0-f195.google.com with SMTP id mx9so1447634lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Y71bMPMyivuXi45EcgDjmpOp6TJLqXwY52jmxEhXRd4=;
	b=eXZ7ZQMBcD4LOqQPETGWBIdIRwjnZGE+Ie6kBsagm3X6dSZxh9g/UZ6dKoceQnqqdC
	TiQSmWPNUWLkjElOQodUZC8hklhW+vSvQLgbM37MQN1iCzX+myIPaWMyn1k6nmBEdyFW
	iXluNJQyA5y7WCaMXfx+4+lWKRu58AWl+wRachj2YUFNwGqIuDaoElLxf3z+Cc+ARRLU
	q++BnnhBFR/uHDMBYI7czlxKEs35ONZWIVd+S6n6m8uWbfdcGBEm5opHKxpTvsEPvtZl
	rZCoaw4PS/H3nnj0Cz+kuKQZpkIivUS5aYlWMNtbTZAPJgdxl4Tsh6hrxdKogn1ELUkl
	Gh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Y71bMPMyivuXi45EcgDjmpOp6TJLqXwY52jmxEhXRd4=;
	b=SxNi2FyJl+NVQHczpDV+ip7NbmGnUYRzyeKkjUhj3r1zptCfTZo4D6pIRcWjDsAV/x
	5jaNgkvLJj2PtqkCeXu3ohl+jEwWXHDdxNqAQ151IOgIYcDBWWVqlyVd8dqmnv2yvPr+
	jma7Iu2bYiSjaBTnc0z/ZJfL9jR5wUvNH17JF4MdAmixI+y7Sx4x3ROu5iB/yJky4sHh
	wNH9Zhato1LcZ8Hnev0pJ9Z8GoTeBDtP/7Nkr8V0C/Xa4rsLx7PMhFG3QdTR+YtSeK5V
	yhSvqhkFA3oFynkVIhxcB0BXrbPutzPhToLPbHpci4BumTQK4sfXQxQkjYqlzk8KBEJS
	wx+A==
X-Gm-Message-State: AOPr4FX3KthOzzFmKDE6kQkrW6b8Uv1xp02QAbwsm+zdkNlIyZniqKy3IRHjqBUdhkTkDw==
X-Received: by 10.28.137.14 with SMTP id l14mr10483809wmd.64.1463062563349;
	Thu, 12 May 2016 07:16:03 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	xt9sm13655203wjb.17.2016.05.12.07.16.02
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 12 May 2016 07:16:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 12 May 2016 16:16:45 +0200
To: Joshua Lock <joshua.g.lock@intel.com>
Message-ID: <20160512141645.GA2567@jama>
References: <cover.1463054447.git.joshua.g.lock@intel.com>
MIME-Version: 1.0
In-Reply-To: <cover.1463054447.git.joshua.g.lock@intel.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [fido][PATCH 0/1] Undo ABI breakage in OpenSSL
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
X-List-Received-Date: Thu, 12 May 2016 14:16:05 -0000
X-Groupsio-MsgNum: 82009
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="J2SCkAp4GZ/dPZZf"
Content-Disposition: inline

--J2SCkAp4GZ/dPZZf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 12, 2016 at 01:06:33PM +0100, Joshua Lock wrote:
> The backported upgrade to OpenSSL 1.0.2h introduced a newer version of
> Debian's linker version-script which breaks the OpenSSL ABI.
> This isn't desirable for a stable release, thus the attached patch reverts
> the linker-version changes and simply adds the 2 new symbols required by
> 1.0.2h.
>=20
> Thanks to Martin Jansa for spotting the issue and suggesting a fix.

Thanks for following it and getting it merged so quickly.

It was already merged in fido, can we get the same to jethro (which was
also recently upgraded to 1.0.2h)?

Small downside is that the same 1.0.2h version in fido and jethro will
have different ABI than 1.0.2h in krogoth (unless someone updates the
version there as suggested by Andre in:
http://lists.openembedded.org/pipermail/openembedded-core/2016-March/118433=
=2Ehtml
).

Krogoth was released with this ABI, so it's something users have
to deal with when upgrading to newer Yocto release (and this won't be
the only component with different ABI).

> The following changes since commit e7c46ce3e59cb4fd770e76ae006c0166d0dd52=
65:
>=20
>   build-appliance-image: Update to fido head revision (2016-05-11 18:00:1=
5 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/openembedded-core-contrib joshuagl/fido-next
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=
=3Djoshuagl/fido-next
>=20
> Joshua Lock (1):
>   openssl: prevent ABI break from earlier fido releases
>=20
>  .../openssl/debian1.0.2/version-script.patch       | 31 +++++++++++++++-=
------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> --=20
> 2.5.5
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--J2SCkAp4GZ/dPZZf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc0h80ACgkQN1Ujt2V2gBxLhwCgjJt2DqRXMC+POrRiug+gbLcn
qtwAoLY999/f6cfNUGASi5II/HJGjwUw
=MEdn
-----END PGP SIGNATURE-----

--J2SCkAp4GZ/dPZZf--
