Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYYZX-0008LK-EZ
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 09:43:47 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so40713bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 00:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Nq0DRBWDlYJKYuDtMMlrkBjZ8IvUWCt6mSL9RHnNcP4=;
	b=ThsBHF5c5SPaVTWOozonPaocDiJaEr5JDHEKhGOPxF3YjuvgzAlThBr2i7F89+eX7U
	lPRyhnhKfmPd62FN1LW6FWGN9hmO2JNLwNs2ZCrnsaEc7dfkZ9So2qngtzaypnxrn4NG
	e9ksbgG/9fQymlocifzXiMHq0CtstyrJka5IhJUTlT6+1ss3t2z6HUpnc2RUCRopkQw0
	1GqqpiZp8l8iXWR2c9Nt8zDLarKnh+OkURqSjEOG79odqYdZMhV9rJ+xOttkA+yiWe0N
	eGAThjVnzdO4vGi0JEa3haKTkbylZhHFSa8IPwlZSIPmS7/kQs8xXeC5pc7BZdBVW2ju
	6SPQ==
Received: by 10.205.126.131 with SMTP id gw3mr8958444bkc.137.1352881792046;
	Wed, 14 Nov 2012 00:29:52 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ht18sm7157583bkc.14.2012.11.14.00.29.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 00:29:50 -0800 (PST)
Date: Wed, 14 Nov 2012 09:30:03 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121114083003.GH3928@jama.jama.net>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<4ccf95a0983379ca7b87f9d7affdba2b824f9a09.1352871028.git.sgw@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4ccf95a0983379ca7b87f9d7affdba2b824f9a09.1352871028.git.sgw@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 8/9] sqlite3: Update to 3.7.14.1
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
X-List-Received-Date: Wed, 14 Nov 2012 08:43:47 -0000
X-Groupsio-MsgNum: 31298
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WRT3RXLOp/bBMgTI"
Content-Disposition: inline

--WRT3RXLOp/bBMgTI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 13, 2012 at 09:32:50PM -0800, Saul Wold wrote:
> [YOCTO #3283]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  .../{sqlite3_3.7.13.bb =3D> sqlite3_3.7.14.1.bb}     |    5 +----
>  1 files changed, 1 insertions(+), 4 deletions(-)
>  rename meta/recipes-support/sqlite/{sqlite3_3.7.13.bb =3D> sqlite3_3.7.1=
4.1.bb} (58%)
>=20
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb b/meta/recipes=
-support/sqlite/sqlite3_3.7.14.1.bb
> similarity index 58%
> rename from meta/recipes-support/sqlite/sqlite3_3.7.13.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
> index 48b50ac..00a3081 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.7.13.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.7.14.1.bb
> @@ -2,10 +2,7 @@ require sqlite3.inc
> =20
>  LIC_FILES_CHKSUM =3D "file://sqlite3.h;endline=3D11;md5=3D65f0a57ca69287=
10b418c094b3570bb0"
> =20
> -PR =3D "r1"
> +PR =3D "r0"
> =20
>  SRC_URI =3D "http://www.sqlite.org/sqlite-autoconf-3071300.tar.gz"
>  S =3D "${WORKDIR}/sqlite-autoconf-3071300"
> -
> -SRC_URI[md5sum] =3D "c97df403e8a3d5b67bb408fcd6aabd8e"
> -SRC_URI[sha256sum] =3D "ac566819f82ec4cc2ff6c5cc90987ca38e589efbd79ff263=
838bbc62356ab119"

Where is checksum for 3.7.14.1?

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WRT3RXLOp/bBMgTI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCjVooACgkQN1Ujt2V2gBzfpgCgi6vUREifCZxZzH8gFOeQSSmM
V1YAnAswz3UqlPwh41vAUaLAsWpuZ7qU
=HIg9
-----END PGP SIGNATURE-----

--WRT3RXLOp/bBMgTI--
