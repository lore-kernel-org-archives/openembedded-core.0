Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 608C46FEFA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 06:25:53 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gh9so5289085pac.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 23:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:message-id:references:to; 
	bh=ZCdZKBJLZf8BNnyBOn1sCMgbFFP0E8SJ0aerrTsBgUA=;
	b=LYH0MM2rFUuQIj2IZ2spubrd38+YQ4CbF6QLjEKk24RNhLJsk9ctTzLCPzkikHg7kQ
	g0G344R4tPKscky7Vok7Sx1e9LfLChs/pJc3YWeJ8HZiwsRvxIZb0DFMg9YmaO9TaE6V
	9rRpOevaNEQ23vPYEk5hlcwCVop2sUTB8iiRsg5v/1f9Brr7tUKR+raXlxaRZJk2+/eD
	cooQ0QtFqzuYogB6xk/+2Y7pkSdzfCcluwKeURkuu41puy15eJKBzh+EzbQJENlvvafH
	urPN1eWDNYO/zBYSILw5q4n2HGZk/5jKkB/jUFqTTXyfHWe8RzaFfhCL+ORf3zRg+Upk
	iw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date
	:message-id:references:to;
	bh=ZCdZKBJLZf8BNnyBOn1sCMgbFFP0E8SJ0aerrTsBgUA=;
	b=dXzWQ9ShNQuOgIm4/Ru7U519ZORo9TCj+PsDvdCoNoiREvYDsxO5Gsb0GBNQspBwio
	xSGKED3iDqWNTaDkzSLiczDN2NT/Fhlnvlc5Ocpb1D2BhrC1sK7PZ4/Fgs5INICMHItT
	3SRTPCtaR9lPzaGGMtZcBxJdc/s46evrI3WtpLJ+vI3FVp0mfj4fgdV0sVItGfbe73L2
	+jE1XSVWvQfsKqxaxdeRK6SH5pgETAfrHwyunt6Va1z/vlXotVICtiKnlP2u6/y6oKwZ
	P2hOsV8BGpS6tcfXBRWAO8N+bUTYBFzWzIwZIF6nGk4YHq2Lej1HRqAFATYWVnkeg1gh
	B2ww==
X-Gm-Message-State: AOPr4FWzbwK31FyXxoQSAwgOjR+lXTznYTg+Honi+yRFB3ENHStKIvAj8a1f5W/yIh5Kmw==
X-Received: by 10.66.246.71 with SMTP id xu7mr11051436pac.17.1463034354747;
	Wed, 11 May 2016 23:25:54 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:7cb8:9b45:b830:2c9b?
	([2601:646:8800:5a9a:7cb8:9b45:b830:2c9b])
	by smtp.gmail.com with ESMTPSA id
	lq10sm16722583pab.36.2016.05.11.23.25.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2016 23:25:54 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <27b4d9f57e6002d301331cd1c6cfb86fdcdca923.1462987863.git.raj.khem@gmail.com>
Date: Wed, 11 May 2016 23:26:14 -0700
Message-Id: <32AD852E-48C0-40A8-9A5C-BC6993D0F6BA@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<cover.1462987863.git.raj.khem@gmail.com>
	<27b4d9f57e6002d301331cd1c6cfb86fdcdca923.1462987863.git.raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3124)
Subject: Re: [PATCH 24/42] python-native: Point to expat in native sysroot
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
X-List-Received-Date: Thu, 12 May 2016 06:25:54 -0000
X-Groupsio-MsgNum: 81956
Content-Type: multipart/signed;
	boundary="Apple-Mail=_448EEF3B-E77E-4FFF-9034-4FD999C0FCC3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_448EEF3B-E77E-4FFF-9034-4FD999C0FCC3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Added missed dependency on expat-native as well is required pushed a v2 =
of this patch as well. It was saught during world build on musl


> On May 11, 2016, at 10:35 AM, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> This fixes inconsistency where expat dependency is
> then depending upon build host having it or not having it
>=20
> Fixes errors like
> WARNING: renaming "pyexpat" since importing it failed: =
build/lib.linux-x86_64-2.7/pyexpat.so: undefined symbol: =
XML_SetCommentHandler
>=20
> also reported here
> https://dev.openwrt.org/ticket/20087
>=20
> This work due to the fact that we use -isystem pointing to native =
sysroot
> so the search order of native includedir is moved after buildhosts =
system
> includdirs. Moment we replace it with -I, build falls apart
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> meta/recipes-devtools/python/python-native_2.7.11.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-native_2.7.11.bb =
b/meta/recipes-devtools/python/python-native_2.7.11.bb
> index 4c204a4..add8868 100644
> --- a/meta/recipes-devtools/python/python-native_2.7.11.bb
> +++ b/meta/recipes-devtools/python/python-native_2.7.11.bb
> @@ -27,7 +27,7 @@ inherit native
>=20
> RPROVIDES +=3D "python-distutils-native python-compression-native =
python-textutils-native python-codecs-native python-core-native =
python-unittest-native"
>=20
> -EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN}"
> +EXTRA_OECONF_append =3D " --bindir=3D${bindir}/${PN} =
--with-system-expat=3D${STAGING_DIR_HOST}"
>=20
> EXTRA_OEMAKE =3D '\
>   BUILD_SYS=3D"" \
> --
> 2.8.2
>=20


--Apple-Mail=_448EEF3B-E77E-4FFF-9034-4FD999C0FCC3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlc0IgoACgkQuwUzVZGdMxQ6UQCeJ2Y3RIa9nV6E8pSxDo3MWshr
IP0AnjEzAVVpCvx5d+iUMJGMa48x3Urb
=2Twa
-----END PGP SIGNATURE-----

--Apple-Mail=_448EEF3B-E77E-4FFF-9034-4FD999C0FCC3--
