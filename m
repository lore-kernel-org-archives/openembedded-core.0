Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4023C75EE7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Nov 2015 16:19:02 +0000 (UTC)
Received: by pasz6 with SMTP id z6so95108417pas.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Nov 2015 08:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=eFfUTntGBSVw2gVU8ziDWVOHRQh/6c8D9/ecQkfO+iI=;
	b=yYjgKZtJhnqb7lPHXqFwq41Ch/PCS8NVXl0YW9GMK+E5wu4/XXPqqxrN2g9tV5gYwS
	h1aPTTwq2AQIKqus7wRd6ntQD2CEj5QTIW/WPbWj124GIppllrIujx8Bp749PB2ZVDKh
	zqcxnHlt300+9MnN/60NC7X8hjU/cP2HMVLX2cVpY/3BnriBkyaQxHEMnaesovxJh7rz
	t/KpNJwUGRPm12li+fE+9AcfGfQKg4jm0MFCRuYPPNg4uNqoYKYUK4rgv6/A2tkzMzY7
	QKF+dJKLRWSZlI5YCBGfb6O+ccQU5RpgpLtDoTiEgRHMLLe2d/Sktcj50cthEWZJY4WP
	LshA==
X-Received: by 10.66.245.169 with SMTP id xp9mr10463905pac.8.1446740342622;
	Thu, 05 Nov 2015 08:19:02 -0800 (PST)
Received: from ?IPv6:2601:646:8601:4580:a868:fcfa:97f1:9015?
	([2601:646:8601:4580:a868:fcfa:97f1:9015])
	by smtp.gmail.com with ESMTPSA id d7sm8761849pas.31.2015.11.05.08.19.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Nov 2015 08:19:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3106\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1446703751-58313-1-git-send-email-wenzong.fan@windriver.com>
Date: Thu, 5 Nov 2015 08:18:57 -0800
Message-Id: <11B9075E-35C1-4101-8072-D44DCDF9A210@gmail.com>
References: <1446703751-58313-1-git-send-email-wenzong.fan@windriver.com>
To: wenzong.fan@windriver.com
X-Mailer: Apple Mail (2.3106)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] openssl: fix mips64 configure support
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
X-List-Received-Date: Thu, 05 Nov 2015 16:19:04 -0000
X-Groupsio-MsgNum: 72929
Content-Type: multipart/signed;
	boundary="Apple-Mail=_70254608-97A5-4A72-8A71-672B130CB910";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_70254608-97A5-4A72-8A71-672B130CB910
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Nov 4, 2015, at 10:09 PM, wenzong.fan@windriver.com wrote:
>=20
> From: Wenzong Fan <wenzong.fan@windriver.com>
>=20
> Match target name linux-mips64 as well, all mips64 targets will have
> mips(32) userspace.

this comment seems to be not relevant to the change

>=20
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
> meta/recipes-connectivity/openssl/openssl.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc =
b/meta/recipes-connectivity/openssl/openssl.inc
> index 8af423f..b69cb4c 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -115,7 +115,7 @@ do_configure () {
> 	linux-mipsel)
> 		target=3Ddebian-mipsel
> 		;;
> -        linux-*-mips64)
> +        linux-*-mips64 | linux-mips64)
>                target=3Dlinux-mips
>                 ;;
> 	linux-microblaze*|linux-nios2*)
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_70254608-97A5-4A72-8A71-672B130CB910
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlY7gXQACgkQuwUzVZGdMxS7JACfcJbc/IuHhZbrKHDvSZyfy5pO
/gUAnjQCBPhCKRMCxjbxavJBCthCzuHW
=1x16
-----END PGP SIGNATURE-----

--Apple-Mail=_70254608-97A5-4A72-8A71-672B130CB910--
