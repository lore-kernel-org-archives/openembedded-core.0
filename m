Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5084460621
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 16:52:55 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id h14so19372170pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 09:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=yxoopMaASpgIfI5VY+8zrUw4RPtf6Iw9TB9/XtMv5ew=;
	b=TrdnWRqFNJeEtg3TeMe257tP5hMFlKsQs4ore6RcinJadxzO4Yqj9Vn3q4TOCiL1qr
	+Sj3hmKjkMnuiS0/FTViUHvsDWSyHB5i8kKoRof3SJc1U2ypUYyI9JkemeJFbr9uG5Is
	kcwDAoO0VPKQb0dOlnVhh5YQK5DcndZKrQW8A2k7sX/AEFBGC0xx7KLO71/rhfJz7re9
	GIPcTt6EFOwDAKtFZXiiDWVaPM7q9+qVrMPxzWFlrgn9shSnVum7nUUpdhtVDibgAYvs
	wT2xbMvMejMubGAMlMetStTxcYF88vOVzmeh1LFGvKh7IbqixhVggwU3B1r5yeQ2LpcY
	d8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=yxoopMaASpgIfI5VY+8zrUw4RPtf6Iw9TB9/XtMv5ew=;
	b=jayCEkgHcm6tRlB/YbD1ZwU6aZ2kYScrPG5oHPgRizfLrSST1J4KjmjkxMO/e4ci9n
	PAf6z7DYolJ187/h1JeJ0pXE/dagMg2XpcWMJzJUZ1ylf8XPIMkwD9W/y3dh2LoHHOy3
	T6RF+gV90tbCRyZKFoxh4E1EDTCl2Iobyy0woi+qxwD87H9zD7k7CV70vcCAj+rRuEoA
	MKEV3L+kBc/jPGvJjCsSumPiNU6WkVtSaKtw5EIDzDOCnzzThVkNMnbFmgAbtXel4cQ/
	vrL4hS4uk6miefNE6OI2aLk2BQSYKBWVmFQxSQsL8jWbTRRGx29Ke3e1QJ/EcaDmLmkI
	GPiA==
X-Gm-Message-State: ALyK8tLmyx37RFYHa7htUQG30R3/+qXD2+Kv3zWveaLtaJNPHq1ejOy7t4WlAq6C8rjw1g==
X-Received: by 10.98.135.71 with SMTP id i68mr35643779pfe.3.1466614375996;
	Wed, 22 Jun 2016 09:52:55 -0700 (PDT)
Received: from [192.168.0.6] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	ym9sm1125061pac.25.2016.06.22.09.52.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 22 Jun 2016 09:52:55 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
Date: Wed, 22 Jun 2016 09:52:53 -0700
Message-Id: <9FC96606-1A87-49F3-8A49-F692CDF8C2AA@gmail.com>
References: <1466609398-17634-1-git-send-email-akuster808@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Add gcc version and tclibc to build summary
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
X-List-Received-Date: Wed, 22 Jun 2016 16:52:56 -0000
X-Groupsio-MsgNum: 83747
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0BA71029-E886-4F53-94C7-49288E62D2F3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0BA71029-E886-4F53-94C7-49288E62D2F3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jun 22, 2016, at 8:29 AM, Armin Kuster <akuster808@gmail.com> =
wrote:
>=20
> Since there are two gcc versions supported and any number of tcglibc,
> it would be nice to know which ones are being used.
> Add those to the build summary.
>=20
> Build summary
> TCLIBC            =3D =E2=80=9Cglibc"

libc is evident from TARGET_SYS

> GCC_VERSION       =3D "6.1"
>=20
> Not sure if the gcc version bit is best practice.
>=20
> Armin Kuster (2):
>  build summary: add gcc version being used.
>  build summary: add TCLIBC being used
>=20
> meta/classes/base.bbclass | 2 ++
> meta/conf/bitbake.conf    | 2 +-
> 2 files changed, 3 insertions(+), 1 deletion(-)
>=20
> --
> 2.3.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_0BA71029-E886-4F53-94C7-49288E62D2F3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAldqwmUACgkQuwUzVZGdMxT4eACcDo45F6WiQJGzd0kAE3V75JAd
UboAn17fNfXEok0SK8wxzRQbxP6MK+jE
=bQAn
-----END PGP SIGNATURE-----

--Apple-Mail=_0BA71029-E886-4F53-94C7-49288E62D2F3--
