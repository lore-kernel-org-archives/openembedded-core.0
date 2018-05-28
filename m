Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6151D74703
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 18:55:02 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f8-v6so34414731wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 11:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=j51q7nQ1Dv1YYj3flp/2le0WUfoKWE5cpt2TV9J2PFk=;
	b=cl+NaQ6/2Ts6Nf2+PweSnM+WmqZtE0n++x7MIfeb9Wpnbo1HLT5ukLWzLTEDVkYUyZ
	UE7Suzq64lcnEt9btBTjSP/Pp5KI/PogcAlwqobh36CnLRbTISSLZeAYoLLjiF2SBsGZ
	tNSbmjaxkKpCVA+dFZ+LFoZpnA0+cLUr3AEHOOCxsh1SlmR5RrtRzar1EcvWbow0ukmw
	y1PUmzPKZVLYHG6to7M5lsCuZJl/MhvCfbcMDb5YT0328rfqo58TaXq0k036nW9LEzKr
	cTU3ccnTdNrw27s9H0VdYc1yabtKTTrVPwQaaadRvqqJazx0qAENYT6eT+AINeI/LY5G
	UvCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=j51q7nQ1Dv1YYj3flp/2le0WUfoKWE5cpt2TV9J2PFk=;
	b=aPAUDNRYuquJCBQyPiujTVVtBGBRakADFOvikXSs2yPV0hs4sr+WyjiixLqN56QEXe
	20jgOjrBNyWgcfyc5NJEeoT+8ZgmwqqKjCBMe/StLtlYXHAG1TEyDRKWsyZXwNBv7ZQT
	miEbk949VQ/dmB/huh9jpzQS3RQfPOLOA9zqB/3sLhczgP3e7dcKd3dcQMMvrdWXrIbN
	Cba+srVbl1cj7GaEvXL0F2qiMuQx8RmWx2Wj5etgChJRlRhmKjwV2ftWM5kuf06Yi0/S
	d7AU8Wo9AfGOcXriq7KpuULNLAPJxPzWoxTjtjyXkx8jj9dNI4Rt3GH4krRwGBynKJir
	5ZLA==
X-Gm-Message-State: ALKqPwfWLrnCU3F8QIHyIl6x0D5v/Rqf16E7qoAF2BTMv2piGG68xEEg
	NSZlimmDg9jjXvPpkhsVcYeI9/ob
X-Google-Smtp-Source: ADUXVKJikucHMMFFGweGDEL9KLqFKgRgMATGWEqYhfB+7l5qdyn0cc97r3FmKHQULKhxYZNiOOspdQ==
X-Received: by 2002:a1c:8012:: with SMTP id
	b18-v6mr8546615wmd.13.1527533703689; 
	Mon, 28 May 2018 11:55:03 -0700 (PDT)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	l10-v6sm9602156wrm.29.2018.05.28.11.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 May 2018 11:55:02 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.3 \(3445.6.18\))
Message-Id: <98DF6614-20AE-41EB-BC2C-D20A477F63C3@gmail.com>
Date: Mon, 28 May 2018 20:55:01 +0200
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
X-List-Received-Date: Mon, 28 May 2018 18:55:03 -0000
X-Groupsio-MsgNum: 111812
Content-Type: multipart/signed;
	boundary="Apple-Mail=_803B05D6-C9AF-4FF4-939F-97DA80DCB42B";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_803B05D6-C9AF-4FF4-939F-97DA80DCB42B
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
-	export PERL5LIB=3D"${PERL_ARCHLIB}"
-	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
${EXTRA_CPANFLAGS}
+	yes '' | perl ${EXTRA_PERLFLAGS} Makefile.PL INSTALLDIRS=3Dvendor =
NO_PERLLOCAL=3D1 NO_PACKLIST=3D1 ${EXTRA_CPANFLAGS}

 	# Makefile.PLs can exit with success without generating a
 	# Makefile, e.g. in cases of missing configure time

--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_803B05D6-C9AF-4FF4-939F-97DA80DCB42B
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlsMUIUACgkQRJmWrtzl
Cp1egw/+OdPuk0vkdgv7ZcCnogD4N0UKyw78BxXYWdtklmoiY7yBgaRAzSyfgmM7
B8jPIYjAdNuhjKXlHS2nQaWZdanah7ikEXNQKDAPb4wSgChSNX+QPxgDPGotWknX
sgj2BGUjyi/gayaArvxxFLgcRr1HrFpBjH2Jexmcdw79lAfOT2yr1v47H7qnH/Bq
qS3g29nwgTVbth9TtTlfX4+Sga3QPByKPSsqXeaBbxHHFrPXyo1itYTG0lxCthaw
DAaPe71jP4g3vG0SDnCUcwV/yUNmC0NiUIG9fMIwB9G3817GfjAtuPSePC19uLO2
tBViHtHZ+ssZl37TKmmeV1hwU2mif1FUd455zkVK4VDjxOa/+DbLuALYe1FX0J8Y
7hSmuuk5A7BVuXOMTcFvfpbXkJeKlUo68GnR37BQrNNHahzv61zpiGevsNY5FBW9
Y7TNTlFuSaSNAf5a7CgCWNiwE1CPUTHsXC+oJNAMQ8EdP7JzeDmXmIMs2Wt7HyTl
rsa2nXHTNpm11q1fe3y6JN+ZRd8zXxscSNX//ImyFyKyLEAvD1wFBlmcIlNkdFQk
IHnzrkJUVQo5/kcK7qRi4dO4837cC7ogO6q5yVxV5vAN9Yx42WPkCi61bvqYVAgo
+iO4KqOtUiDG1tBUOAens4k6jDd0GQsbkRvts82zIx58x7VDcHU=
=tF+Q
-----END PGP SIGNATURE-----

--Apple-Mail=_803B05D6-C9AF-4FF4-939F-97DA80DCB42B--
