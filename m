Return-Path: <rehsack@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1F574EC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 15:49:30 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id i14-v6so16499011wre.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2018 08:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=K0DtTPf44TZCEIqZS1RhKI+KhjApWCXtsY8BZ8PZWbs=;
	b=O+ZBV/L/f9L0zHgk/Th3jhsuFum7ZqVYhbYiOdGfOwBGop7QtQ0ahds4mQM+q5Lj7B
	v/4sQxz/ybwtX3UpuVcdeRG6WQ4lMfvPciP6EQ9v1cAOm8qw7r96CYQUXC+kK9k3D4mf
	Nbh2ekQArgllVlab6oZUKoG5m0OdVN+2+GIDK51ttaywEaArXn+/dJcdEbwcitcjHUgc
	AJPF/zkkJyTk6Tkvk191bwDVoxVgtU6Ut92EorNf4QUlgt995NoGcL3ohmyGVBgc7myN
	SYMK48YRw2DAP98GDWxOkNGWxXfNyBYq1gOcUKrXsaVXmHSTcirjDI5t8eXQK6JI1OpC
	bXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=K0DtTPf44TZCEIqZS1RhKI+KhjApWCXtsY8BZ8PZWbs=;
	b=IkiTs8P7nc5lMu/FIG9s2d3+X6HZ8gz+riE/tiXfOVDPeKwu1adSU01cmprje+iMWW
	drTrZzcOrarlfXdqta5saQoAQxSJuX9JJvIPDFU2IVNLRWlXS8+YQKlbePC1hgGcB/xO
	B9fwod161Oa2SbQVcG0n+aL7Biph8PD8jOjVDeZ+20kJd6+cltXgFrJeBz3bHvla1BwY
	Td2crzZiXMSHGf3GB4u1PLJm82CVIjA+Kiv1xzA8QjJNEo0uhguDxYdVfTSWCGMY8wtt
	wzqQ1fRmklPs9Momb/es6N5j1+fkHt288Au3L2w7NfMWLY2hjnDtnYKJA6aGkcsPvJcW
	qtZg==
X-Gm-Message-State: ALKqPwf5lE+zNYs9wKhU+CtrQB7cTZOS/SZQ9lD/BfwuQ7Y7UAb7ANtu
	2UOl+l2k7KwRW25v7Q4Uv5mWAgTT
X-Google-Smtp-Source: AB8JxZri+ZqmrHg8Apb5ugHoHT12y7nPjpUz5NiPil8i6ZRr9pLuM/cq0hgv9dLhN/GW/eC/fTchNg==
X-Received: by 2002:adf:b937:: with SMTP id
	k52-v6mr16172081wrf.116.1526917770718; 
	Mon, 21 May 2018 08:49:30 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	y81-v6sm14995409wmd.31.2018.05.21.08.49.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 21 May 2018 08:49:29 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Message-Id: <41247391-97E2-4A0C-9928-0D9788A36181@gmail.com>
Date: Mon, 21 May 2018 17:49:29 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.6.18)
Subject: [PATCH 1/2] cpan_build.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Mon, 21 May 2018 15:49:30 -0000
X-Groupsio-MsgNum: 111563
Content-Type: multipart/signed;
	boundary="Apple-Mail=_58EF7DFF-F2FA-4193-B578-C2316CD7BEC7";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_58EF7DFF-F2FA-4193-B578-C2316CD7BEC7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

The modern the time, the improvements in ExtUtils::MakeMaker.

Nowadays, .packlist and perllocal.pod aren't touched anymore when =
appropriate
flags set during configure stage. Controlling the flags globally avoids
dual-life recipes need share patching.

Further: remove prepending ${PERL_ARCHLIB} in PERL5LIB - it's wrong =
(search
order is site_lib, vendor_lib, core) - and ${PERL_ARCHLIB} contains core
libpath only ...

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/classes/cpan.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/cpan.bbclass b/meta/classes/cpan.bbclass
index 8e079e0d55..926c6358a6 100644
--- a/meta/classes/cpan.bbclass
+++ b/meta/classes/cpan.bbclass
@@ -16,8 +16,7 @@ export PERL_ARCHLIB =3D =
"${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 export PERLHOSTLIB =3D =
"${STAGING_LIBDIR_NATIVE}/perl-native/perl/${@get_perl_version(d)}/"

 cpan_do_configure () {
-       export PERL5LIB=3D"${PERL_ARCHLIB}"
-       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
${EXTRA_CPANFLAGS}
+       yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 ${EXTRA_CPANFLAGS}

        # Makefile.PLs can exit with success without generating a
        # Makefile, e.g. in cases of missing configure time
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_58EF7DFF-F2FA-4193-B578-C2316CD7BEC7
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsC6okACgkQRJmWrtzl
Cp1HHRAAijgmE/uEhMKRCDq4jby/CS5HN038yhIAqNA+uD6xHpHyGYFFiVLD6Nyv
UpiYEBewuNqfSxuLFstZuIqy/eug54qsIuTKwdmYzMsYPtedLSFdre4FJTwkKnxo
pWtohz9mtDN6j8EVKU4eUTDbTlWScIkC1PSqRxrXkbKpNFp88FTPaKrqoCEohygi
weCPuTtErr99dhHAwXanWF93CVwtLFwj7j6zt6P0V7NnOPqW7t4tP3LEETbO0gk8
7KqsvXQ6U8eaLf26qRJ2xlXvGevsDJhE8uHM8dczzxpEG4He4Zknz7CHTsWdyOmK
tDgPuOIAQIM2yxJ9QLgJbO5awTy90qQSwS7suYYvvC4002uUwyvGNcffsSGaTuGZ
9F+UtqSZ61HrJpmQYfxCl0Y4Rw8P1gMp7EwmaWLC98eNu9WWP+xG+qXLCISpd3f7
WSx6X9qaZ5diM6gbFDaOK4rnv7k9sPrqMAO2vsFwGM82YOfIbq7fveogSAZWaB87
2vKtycgmJA8vZEWYyQmnumCSvDIQPqq5iDxm12R7K1coKoiRr6P76hpcQf07+Zzh
Wl9cHMKvtLDdJ3gh8syvFOEmZIWMg2YdkT/coHTWnMl0G+KrJ0zVGQ4wzCA8zC3e
4ERet1FaKWU4FEP8HvUNszZo4Vi8QkvcwNVCYHl61EcvVzmBFuM=
=8TG3
-----END PGP SIGNATURE-----

--Apple-Mail=_58EF7DFF-F2FA-4193-B578-C2316CD7BEC7--
