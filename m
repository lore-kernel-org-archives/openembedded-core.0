Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3F660842
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 15:16:31 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so957589ead.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 08:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=C+2osIXxOhXxSbDw5hfdhOvqhaT818iULamh9TXnkd8=;
	b=lU20Hfasfl9lBnQ/4FRD74ZwIPoExm9o5A4agY4PKfxZUY1Zixh6sKrXFOkC8x9PAX
	GHfiy3Jve3i3VeFFzhPoXn/qreovwnCzsJKPq7fIrfTLxd5OGEot0QajMxo8EPxeY9zw
	G7yYq0XwkdfhEtg+G4A3W5mjcA7937YZ2c+rZgd2T6vFtauP2zxbpQ9wVE0pLhUjPi0i
	mvsCWttVzpZkupQHKdJ5lNP82RMhm5UMfCiMa1EFTL3rawewWJ7+Mmvp+saSqDxAFoKL
	9+7mX1SrTrr7NmaBAic79U1OtUauxUBKZ21CQKYlqhKg8NWsHuKJzorZ6fIAThwO/dEw
	2hgQ==
X-Received: by 10.14.100.4 with SMTP id y4mr466850eef.75.1377184590870;
	Thu, 22 Aug 2013 08:16:30 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm18186824eeg.13.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 08:16:30 -0700 (PDT)
Date: Thu, 22 Aug 2013 17:17:36 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Ross Burton <ross.burton@intel.com>
Message-ID: <20130822151736.GL522@jama>
References: <1377182178-19511-1-git-send-email-ross.burton@intel.com>
MIME-Version: 1.0
In-Reply-To: <1377182178-19511-1-git-send-email-ross.burton@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] runqemu-ifup: when tunctl can't be found, say what package builds it
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
X-List-Received-Date: Thu, 22 Aug 2013 15:16:31 -0000
X-Groupsio-MsgNum: 43774
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="z9sQuz+HmDh2hVO4"
Content-Disposition: inline

--z9sQuz+HmDh2hVO4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2013 at 03:36:18PM +0100, Ross Burton wrote:
> If runqemu is used without actually building any qemu images (i.e. you
> downloaded the images) it's likely that qemu-helper-native hasn't been bu=
ilt.
> Instead of just saying what command can't be found, tell the user how to =
solve
> their problem.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  scripts/runqemu-ifup |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
> index 5f6a437..140dd88 100755
> --- a/scripts/runqemu-ifup
> +++ b/scripts/runqemu-ifup
> @@ -53,7 +53,7 @@ NATIVE_SYSROOT_DIR=3D$3
> =20
>  TUNCTL=3D$NATIVE_SYSROOT_DIR/usr/bin/tunctl
>  if [ ! -x "$TUNCTL" ]; then
> -	echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DIR/usr/b=
in'"
> +        echo "Error: Unable to find tunctl binary in '$NATIVE_SYSROOT_DI=
R/usr/bin', please bitbake qemu-helper-native"

^ inconsistent whitespace

>  	exit 1
>  fi
> =20
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--z9sQuz+HmDh2hVO4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIWK5AACgkQN1Ujt2V2gByg0wCgqmq2siurV6jJ4+a2OWlYdHzJ
l7cAnRaldBcRi2pQofKg6hxnc1I0aqXk
=y2u3
-----END PGP SIGNATURE-----

--z9sQuz+HmDh2hVO4--
