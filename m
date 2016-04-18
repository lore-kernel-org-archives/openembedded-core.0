Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 476C760667;
	Mon, 18 Apr 2016 05:15:09 +0000 (UTC)
Received: by mail-pa0-f51.google.com with SMTP id er2so46487418pad.3;
	Sun, 17 Apr 2016 22:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:subject:date:message-id:to:mime-version;
	bh=crAoWIkStZYz2CGbrCQkmprkIjS5bqLwlJ/vzLe3qTM=;
	b=dWHVUt2RpLV6RxhYFYHRszDYr1cOhzPvjDSsyyGLNuJuWepnxcQWwI8wYlJ96CDUpj
	5YSXoq1b8sNq+BhS8tiGdlF/0NELXJBWSjtXn1Sb9uXyiGV5QXeMJOEp5SC5yFp8inqC
	2X3fAu0jXlMLQtaG4/LXq5W0OVTUAyRsrxfVdjTIitR5F4UxNHAgFtakgtVaklgdUYqe
	Sr5qxYXXNz7Q9FKb17BKMgb5dZTHuzfotQwJb7DENe1GT8KiBWm2bqrDMjoN+d/Sgh15
	c0Qzw8/82pFxODgR459w1Qrr95x4ox1vqVWEcfSjULAgVNovvzUk5WARPpwQFTlLjpMm
	srIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:subject:date:message-id:to:mime-version;
	bh=crAoWIkStZYz2CGbrCQkmprkIjS5bqLwlJ/vzLe3qTM=;
	b=AKuE1FwVaVe8O4YpzSoERke7VX0YP9uCUGMH8TgkFX6HiBsLMWmljt3ib9ppzWu/Ai
	0K/+BNrXCay5XaH1945I0gBntyCMJUS/KT96LjsX8alJTj5neSTmfwV0lP8+jhC6LI9b
	pZK5gNXpsIk9zUCnuv8SlCfzEEzGwpj2UhDhRSTBT1DrSjc+zMkGwfxZKjud65lKmVYt
	eMsT4FZMr1jAbRG7Il5aqzD0mViCSypF80SlHVy/kNtFZ8ZQU/7xiHrSHWpwo0OYN4Xu
	kW/CnzHvY28ChROQeRzWy9i1+bmyLUO/QlcEMbNrAIrFbueshlY5euMCeEEfrFT1mis8
	30sA==
X-Gm-Message-State: AOPr4FUzYOULMmHV+t4pPiLfG0+q1BDcmhSOz85lqUWAmxU+47aXHvza9ko/r4ZCft/Vag==
X-Received: by 10.66.62.232 with SMTP id b8mr46803647pas.104.1460956510485;
	Sun, 17 Apr 2016 22:15:10 -0700 (PDT)
Received: from ?IPv6:2601:646:8800:5a9a:bcd4:460b:c427:512f?
	([2601:646:8800:5a9a:bcd4:460b:c427:512f])
	by smtp.gmail.com with ESMTPSA id
	y27sm80126857pfi.11.2016.04.17.22.15.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 17 Apr 2016 22:15:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Sun, 17 Apr 2016 22:15:03 -0700
Message-Id: <B1D22563-F31B-4EF1-90D6-16EB391134D5@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Mailer: Apple Mail (2.3124)
Subject: [RFT] GCC 6 Recipes
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
X-List-Received-Date: Mon, 18 Apr 2016 05:15:10 -0000
X-Groupsio-MsgNum: 80934
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D380721D-F5EE-491D-A6B6-0C25DCA60A6B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D380721D-F5EE-491D-A6B6-0C25DCA60A6B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hello all,

I have put together a potential gcc6 upgrade recipe set, and pushed the =
branch to tree here


http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/gcc-6

and also at github fork of mine.

https://github.com/kraj/openembedded-core/tree/kraj/master

You need to set

GCCVERSION =3D =E2=80=9C6.%=E2=80=9D

in local.conf to enable it.


There are few recipes in OE-Core which still don=E2=80=99t compile e.g.

see

http://errors.yoctoproject.org/Errors/Build/14782/

any help in fixing them or otherwise fixing other layers is appreciated.

gcc6 is a major release for some info see

https://gcc.gnu.org/gcc-6/changes.html

and porting guide

https://gcc.gnu.org/gcc-6/porting_to.html


Thanks

-Khem

--Apple-Mail=_D380721D-F5EE-491D-A6B6-0C25DCA60A6B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlcUbVwACgkQuwUzVZGdMxRPTACfUVB+XNWT+8+tZYfq38MBc5DQ
d8YAoI475gdTOoaX/3suuYdeaqvgf83D
=eSJK
-----END PGP SIGNATURE-----

--Apple-Mail=_D380721D-F5EE-491D-A6B6-0C25DCA60A6B--
