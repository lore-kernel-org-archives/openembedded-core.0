Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3C49978DD5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 08:20:41 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id h10-v6so1182370wre.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 01:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:mime-version:subject:message-id:date:cc:to;
	bh=qLFTaJvki54+2iUwmnfa8i85YVevCuvlCLnpABJ5PEw=;
	b=XfqlGgYbDOzO8h7xTQvzDw8bc2AeGDrSsc8wPfwtyyrQbcZUcChCuCsxmnK3CLSp6p
	fK3hbAPQWJDThV9uI40u8ezMPlbSMq84yEqnH3+dY0ORhiai+sTxQJTOZXFHQkYYmpOa
	nZpArh0TN2gEtYaoSADIl6eyesFQ2OYOIrIFGdUs9nlVMd+DnDU6cV+5DWLKyt7ZYIDY
	pUVuVfnPlvHgtwF8dRamQ7f2FTA2tzu3Hwg68fViruFI4FFRqT7p3ks1Cxutgw1r8JBX
	1yEyouA9ZwBdIJ6MX/Ld2VLs/c51bHSnU0G1LlqwsHhDrNmNtCJunP1Ed8VQVtlcgxYe
	pxeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:subject:message-id:date:cc:to;
	bh=qLFTaJvki54+2iUwmnfa8i85YVevCuvlCLnpABJ5PEw=;
	b=ApDU2kI2ik9L+I7s2RJUT+ZpFvBz/yp1dO3CgkmDKKSrjI16NQjmQpyR1e3Vl4xUyf
	unVyU/0ffobk0qpHiZgb2cf0cO6ZXrZ/fK+oQJfWnbJ4H5jKInggD5MiyQiPmHl3q5cr
	cweFns0/VxNViTI7HWSRKWUapNDtkpF3FaAB1NA8eSNxfJJ2hbinpfRThSfWB/gqEa+y
	2FeuVi1urs9uJmU/pNcJUzOPxM5/NxvRYOaY0r/B5GToddFAGOhFcOQKqOiOyI8sJJSG
	QevnLP9kYnitKLBGpRc4q37GFtOimO6qUbCeIYcY5UhcS3L0qUcSENvhk0ALluLG8hz9
	owtw==
X-Gm-Message-State: AOUpUlGiPW4sKsAAAGNeRxgg0jUhYrga8Lw9WunkL0gVXyVkfoiI3NLH
	tlTvnxBSH6p3+gjEbVAaOZzm49eO
X-Google-Smtp-Source: AAOMgpcyC/3hxxESQ8td3n7/pwr7UXCU5tsBb1rYQSI4hNlevXIzSA22mqVyJWEVwK6VGJKruCE/0A==
X-Received: by 2002:a5d:4d8d:: with SMTP id
	b13-v6mr1153504wru.80.1533198041767; 
	Thu, 02 Aug 2018 01:20:41 -0700 (PDT)
Received: from [10.42.8.249] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	w8-v6sm1322675wrp.72.2018.08.02.01.20.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Aug 2018 01:20:40 -0700 (PDT)
From: Jens Rehsack <rehsack@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Message-Id: <C4F20EE9-9435-4061-B634-871DE7DF369C@gmail.com>
Date: Thu, 2 Aug 2018 10:20:38 +0200
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.3445.9.1)
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: [PATCH 1/2] cpan.bbclass: adopt to recent EU::MM
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
X-List-Received-Date: Thu, 02 Aug 2018 08:20:41 -0000
X-Groupsio-MsgNum: 114226
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F861AC06-DCF7-4776-9BCB-5D29F5FF069E";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_F861AC06-DCF7-4776-9BCB-5D29F5FF069E
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
2.17.1


--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_F861AC06-DCF7-4776-9BCB-5D29F5FF069E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAltivtYACgkQRJmWrtzl
Cp3Q5A/9FV8PXxOiqUjgOSJD7Ne8pnWrj8WeeItwLDgHW2PTvZwF0YhRUV57zLxB
7mK62Ph8BwvARoEXlQeemculkY2GgGBpSdIfPzVeQAq5uQo04ldTv1NKv9YXW13m
Y+zpqbgEfkO4Hecx/jl5Y0dMY0b/HPJeXQ8fBQkGJYb6Ccr3rYPHSFGEIth6UqZe
RGNZjsS8S5EEx8IKXYPwHVVknUqj9pBOnHqp8DLheINBDBALYji1DHuyZMaK6BTp
KWFCR893emFG6miS3QLWK6w/qUWKHiASVCuUlvCRlirpCwYVlcwSrWouxXNjc5tx
fySivLkuwVEJgWqgtxxasbcsCuLS48vISUP5CqtDwiQ1L+Usa56xKeKUdc6Hb9rD
mig+XOa5+8NsL0r/qR4jj9GV+XWTpEiOghE1uiDS3UHwWFxpDsN1GN8+H2xHlyO6
5W01aJB6so8ec28KFf7v9FGyjDTOZcF41hE45H8kNL0GgUWEvbSAWr9OwDkBcCSy
TP4H48W8WRc7EMcDMCV0Ap6kxuYyFdbuwkkoBAZ4dyukoxFsCQpj7TvF5XVRtRtM
Do7FQmv5WVYhiEg8aOGeIH92vXacGe4FXs1l+IJHo9InngGNo5Kj5wi1Uz+2vrVy
VOLNFwnNq4IomOiwTHkTrdy9bxlLjBqzQzk5/jK+/Zqrr8kqThA=
=99A8
-----END PGP SIGNATURE-----

--Apple-Mail=_F861AC06-DCF7-4776-9BCB-5D29F5FF069E--
