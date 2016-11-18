Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7C91E6059F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:58:39 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u144so5990633wmu.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 04:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc:message-id:references
	:to; bh=4PhwMf25oHWEaTbfSGQOp3HFFn1JFVHEqhXAsd4/wlg=;
	b=0/ps6+aVni/HYYDi2njMgEhh+LsmFYS6Rl2aEvRJfF4bCNXnCdykE8opp7G6TVtMZG
	3DdSeW4H/GcoMG5pgJjFQBhBhAooUsZXO/ENh7czuUg+iqqklMf8JQLUaKDT2qSZy/BJ
	vpWYeEks3x5zWNDsTJEYYsqi1/h91rAv0w+kExxNqIZS784ZFGRFoYDSGB4maKXiJya2
	s2i1HWrsE7lC0sGVAsia+aiGFjHkAmc4jYptaEoK+QPZb869IenvGrCwWa87Gx13vLGD
	6XbeucIUuE0pnwIP2TVYKq+L4Arn1zqizM34TED1oCRv/lOSG3gz4xb5osJ02T0nAzyc
	v2Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=4PhwMf25oHWEaTbfSGQOp3HFFn1JFVHEqhXAsd4/wlg=;
	b=ROMmilBduMZRgDWF/O2DdSkPRPqLSdU4WMSkAI6yrS1KDUIZuPCDCXLpLBat2EBk7Y
	WWi8cP1pJQgQnLOL5gBg3b6J6x/yid5zdmdf4MnW6LcX8Wf9x80TWAQfheILJrht6wz3
	DEFOSRX980W+VHIKFKH7RoAM9VvdE1DL3SmKUq1F4WVkBbvYcj/5Dynwf5p4t7+pxv7J
	eq1gylyLHeTPR/dSpigYmo8bjMLu9KpU/edOFRZ4kEFW+TyrnukhGaEv966txaAO/DXL
	j/07i/6489XYcGOiB8rVzWflrflAkb2wASekOlbRDFpVBZl8U8+owWGLxLeu8pyhniXY
	LXvA==
X-Gm-Message-State: AKaTC02RQ5CMMVpck8Ct7z5A0AsTuAi8QcaYcWxnqXb4ELE+9plJPnPcQp1kTT9LZFKKNw==
X-Received: by 10.194.235.198 with SMTP id uo6mr6929746wjc.40.1479473920444;
	Fri, 18 Nov 2016 04:58:40 -0800 (PST)
Received: from [192.168.10.204] ([62.157.143.22])
	by smtp.gmail.com with ESMTPSA id
	197sm3257255wmy.16.2016.11.18.04.58.39
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 18 Nov 2016 04:58:39 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <alpine.LFD.2.20.1611180513530.24565@localhost.localdomain>
Date: Fri, 18 Nov 2016 13:58:38 +0100
Message-Id: <3A38245A-188C-4A9E-9BD8-14E3BCAC9F19@gmail.com>
References: <alpine.LFD.2.20.1611180513530.24565@localhost.localdomain>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-Mailer: Apple Mail (2.3124)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: perl packaging, Makefile.PL versus Build.PL?
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
X-List-Received-Date: Fri, 18 Nov 2016 12:58:40 -0000
X-Groupsio-MsgNum: 89568
Content-Type: multipart/signed;
	boundary="Apple-Mail=_34F72F38-1941-48B6-B473-BA9BF69B9678";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_34F72F38-1941-48B6-B473-BA9BF69B9678
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> Am 18.11.2016 um 11:24 schrieb Robert P. J. Day =
<rpjday@crashcourse.ca>:
>=20
>=20
>  still going to have a few more questions on the standards for
> packaging perl source into OE recipes, here's the first one.
>=20
>  as i read it, there are two build standards for perl source in OE:
>=20
>  cpan.bbclass:		Makefile.PL build-based
>  cpan_build.bbclass:	(newer) Build.PL build-based

Err: Wrong - Module::Build has been written after ExtUtil::MakeMaker =
exists,
but it has been removed from Perl core, because ExtUtils::MakeMaker is
much better maintained and has better compatibilities (even if it still
can improved ^^)

> so if one peruses the source at CPAN, it should be obvious which build
> system is relevant, no? so what about source that has *both* those
> files?
>=20
>  https://metacpan.org/pod/Parse::DMIDecode

Look into it: =
https://metacpan.org/source/NICOLAW/Parse-DMIDecode-0.03/Makefile.PL
shows clearly, that the Makefile.PL is a wrapper for cpan shells which =
don't
support Build.PL (very old, but when Nicola uploaded it in 2007, 5.8 was =
bleeding
edge and 5.004 or 5.005 were widely spread.

You can also refer to =
https://github.com/rehsack/Packager-Utils/blob/master/lib/Packager/Utils/R=
ole/Packages/Bitbake.pm#L507-L517 for some inspiration.

> which has both of those install scripts in the top-level directory,
> although the INSTALL file clearly refers to the newer build system:
>=20
>  perl Build.PL
>  perl Build
>  perl Build test
>  perl Build install
>=20
> does it make any logical sense for both of those files to be there?
> backward compatibility? any other reason? or am i just wildly
> misunderstanding something?

For some people: yes. For others: No.

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_34F72F38-1941-48B6-B473-BA9BF69B9678
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iQIcBAEBCgAGBQJYLvr+AAoJEESZlq7c5Qqdr7cP/i4aHoTQGWnVFv/ADoP/OP7i
nd1oNogNpBySzt9EdWZvs6xRitPhiUNxUMQH/nP8UbvbeyvGwaTDC789mscjb2Uj
s03wbjD47NFxANwNXoQPJBnZmloVBMJ53vwBmcI1tdd1W8GFvvY/+9y/22o0C1ee
PtXdDvkZ+Mper7Zg4M+BspjoODLJweZs25OrycaEOcEDj86eCQywDw8XVvYdi2VX
VoxIIydtkBIegMvK/GENBiANO6KD+jfTY7IIz2aISomiOVkp+bflqR4ymjV08gde
X4k6FiNvEKqBMjXYK3RGFNV86hlN1ZAyoqxy+g67l0QQheiZvEe8zaG9jqkDdmWk
uwziEjBdQdWo/bYuKz0HzwKAG6V8rYlwkS2XTjBTi8Y+gTFGF/4nqUi7FI5qOY7R
DF2qylL6uLuchR0GgeK+aNxgONeyfMcFa1PG+q5xtn4FJxDCFOMZcQad8H52ejFh
hCG+kXR5BUe7uWPbnki8aMfN59vSOVGgAw43XlDKlXtfzE9I3TvyIorribONvxJG
V3HZbWXSaZ84Vowfqt8LdbcUyxtjnGFUg1oUrxtK8tnRjt7ZLAfOTyGrxA70Pqui
NnaYDNV/aVmB3iVRzTwteSxAcolkeAIrLpUdT5rLGEK5pfCl9T7YnKUnu0Jc0cJh
Si69nwI1Jbn3IKGZzmKr
=dW7P
-----END PGP SIGNATURE-----

--Apple-Mail=_34F72F38-1941-48B6-B473-BA9BF69B9678--
