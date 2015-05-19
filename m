Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 4AAE060125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 May 2015 01:39:51 +0000 (UTC)
Received: by pabts4 with SMTP id ts4so1079107pab.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 18:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=S2fxeVfrMM4Ts7vtz/vcjWUQ0hl+AY53m7QtU9pDers=;
	b=hBb9am9cNvlCNw1/l1XKpzOrBZ9VoB7YNasl1NCOtTS52oFoyxR14g5sI2ibbst3NA
	uevfsrBW4R12fDL3lp8zd24GPHx/xmCMHvEEoaG62nzOa+HEFssintZA2sW5VL4CQ9a9
	tmpAEvKw2IiV9QR8eiCon+YK/D87oh2MJz+z+1qN6sDXiuLxfZcC6lbpIBQoZAe5kbtv
	lC+KdI72KjZqQYSIy5mY1YPRKvzKhwwymrtYvj6RpXGDVrLfumYnQyqSlb/pJj7PSpdK
	n1bMOkuJrrJqv5YtQ1TQjZIoSwW/eEeg7Lb0qXk7QsvS8+5MEDoYs0y5KbyUq2+EnQiN
	C3wQ==
X-Received: by 10.66.249.101 with SMTP id yt5mr48980072pac.116.1431999593097; 
	Mon, 18 May 2015 18:39:53 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:d1bd:ca93:84da:dce8?
	([2601:9:3580:84c:d1bd:ca93:84da:dce8])
	by mx.google.com with ESMTPSA id
	kr9sm11243149pbc.34.2015.05.18.18.39.52
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 18 May 2015 18:39:52 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <268bc2f75252f5da7609501fe931810528ffa405.1431591045.git.liezhi.yang@windriver.com>
Date: Mon, 18 May 2015 18:39:51 -0700
Message-Id: <B085B186-562A-4004-8561-ABF22CC2F530@gmail.com>
References: <cover.1431591045.git.liezhi.yang@windriver.com>
	<268bc2f75252f5da7609501fe931810528ffa405.1431591045.git.liezhi.yang@windriver.com>
To: Robert Yang <liezhi.yang@windriver.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] gcc-5: fix installed-vs-shipped
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
X-List-Received-Date: Tue, 19 May 2015 01:39:52 -0000
X-Groupsio-MsgNum: 65690
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A5FFDD02-1547-4689-89C6-A78BA2F6CE61";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A5FFDD02-1547-4689-89C6-A78BA2F6CE61
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 14, 2015, at 1:11 AM, Robert Yang <liezhi.yang@windriver.com> =
wrote:
>=20
> gcc-5.1.0: gcc: Files/directories were installed but not shipped in =
any package:
>  /usr/bin/i586-poky-linux-gcov-tool
>=20

this is ok

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
> meta/recipes-devtools/gcc/gcc-target.inc |    8 ++++++--
> 1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc =
b/meta/recipes-devtools/gcc/gcc-target.inc
> index e348517..5d31446 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -83,8 +83,12 @@ FILES_cpp =3D "\
>     ${libexecdir}/gcc/${TARGET_SYS}/${BINV}/cc1"
> FILES_cpp-symlinks =3D "${bindir}/cpp"
>=20
> -FILES_gcov =3D "${bindir}/${TARGET_PREFIX}gcov"
> -FILES_gcov-symlinks =3D "${bindir}/gcov"
> +FILES_gcov =3D "${bindir}/${TARGET_PREFIX}gcov \
> +    ${bindir}/${TARGET_PREFIX}gcov-tool \
> +"
> +FILES_gcov-symlinks =3D "${bindir}/gcov \
> +    ${bindir}/gcov-tool \
> +"
>=20
> FILES_g++ =3D "\
>     ${bindir}/${TARGET_PREFIX}g++ \
> --
> 1.7.9.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A5FFDD02-1547-4689-89C6-A78BA2F6CE61
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlValGcACgkQuwUzVZGdMxSNWQCgg5RRTzR5S04x2btlg3MR31ho
mFIAn2/qnhA9sTC0BIJVet3b0+3TnOJs
=qHbs
-----END PGP SIGNATURE-----

--Apple-Mail=_A5FFDD02-1547-4689-89C6-A78BA2F6CE61--
