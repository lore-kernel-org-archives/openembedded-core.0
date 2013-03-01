Received: from mail-pa0-f48.google.com ([209.85.220.48])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UBYxx-0000Sj-2D
	for Openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 00:02:14 +0100
Received: by mail-pa0-f48.google.com with SMTP id hz10so2078065pad.7
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 14:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LuU84pVPnW9Zo0EOS4Prefq7QnQaP5x3e1w3Ti9jG6M=;
	b=VUaHp6BKEUOmT1jBfLDkrNWpT6sIwMKHMurYmU3CC4/JdDL8i47eRUjkLAk9srlLg+
	GXYkvMlFPtqcuKbMigVFWnh0aiELlbtFpU/DOxJ6V4TJDKpIykpvu1s9cTd18d25h8oV
	VjgAog0RFySQlpMjp5k9QduXnLvAzhEUvI8CNTx4fDFpG6JNEDWArXonpn6JFO6BlEHT
	pW0JBd9UHKHvpnKdIdn323L+NrKq3AwTsiOqGsaefiLq/3rCv384NNfJnioU86c5JKyH
	czlY5IK8qSUsxkdUh5aEQ3O1JUxgPf6SFy5O3wv6ScykhHlXqmYw0vvcdIvrtXwM2rur
	alLg==
X-Received: by 10.66.147.98 with SMTP id tj2mr20624502pab.148.1362177948358;
	Fri, 01 Mar 2013 14:45:48 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id eh5sm13339306pbc.44.2013.03.01.14.45.44
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 01 Mar 2013 14:45:47 -0800 (PST)
Date: Fri, 1 Mar 2013 23:45:38 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Rich Dubielzig <rich.dubielzig@windriver.com>
Message-ID: <20130301224538.GV3279@jama>
References: <1362177552-10996-1-git-send-email-rich.dubielzig@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362177552-10996-1-git-send-email-rich.dubielzig@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] pulseaudio: Specify gdbm in configure
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
X-List-Received-Date: Fri, 01 Mar 2013 23:02:16 -0000
X-Groupsio-MsgNum: 36123
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6yuPXOSZRpyw7iEV"
Content-Disposition: inline

--6yuPXOSZRpyw7iEV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 01, 2013 at 02:39:12PM -0800, Rich Dubielzig wrote:
> The OE code as-is makes pulseaudio depend on gdbm, but the actual configu=
re
> process may automatically select the tdb library if a samba build has alr=
eady
> started.  This is problematic because it's nondeterministic and the samba
> build may not be in a completed state causing compile to fail.
>=20
> Signed-off-by: Rich Dubielzig <rich.dubielzig@windriver.com>
> ---
>  meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    1 +
>  .../pulseaudio/pulseaudio_2.1.bb                   |    2 +-
>  2 files changed, 2 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/rec=
ipes-multimedia/pulseaudio/pulseaudio.inc
> index 11c6355..fdf4a8a 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
> @@ -37,6 +37,7 @@ EXTRA_OECONF =3D "\
>                  --disable-orc \
>                  --with-access-group=3Daudio \
>  		--without-fftw \
> +		--with-database=3Dgdbm \

Please don't mix tabs and spaces for indentation.

>  "
> =20
>  PARALLEL_MAKE =3D ""
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb b/meta/=
recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> index e39b69e..2f3728f 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_2.1.bb

Isn't 3.0 already in oe-core? rebase on latest master.

> @@ -1,6 +1,6 @@
>  require pulseaudio.inc
> =20
> -PR =3D "r3"
> +PR =3D "r4"
> =20
>  DEPENDS +=3D "libjson gdbm speex libxml-parser-perl-native"
> =20
> --=20
> 1.7.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--6yuPXOSZRpyw7iEV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlExL5IACgkQN1Ujt2V2gBzyXQCfUVSqDuKSaNRlzXSzQlxjM8jF
secAoJEuM5dJJSlCLzb4YAZ8Oa+n9UPI
=fjeD
-----END PGP SIGNATURE-----

--6yuPXOSZRpyw7iEV--
