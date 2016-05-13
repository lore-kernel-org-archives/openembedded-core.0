Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 528376FF5D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 14:30:51 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id w143so4066753wmw.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 07:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dYpnDQuOoYLiPdPW3Vt29p4f8JYOayADXMQxvtlPfEw=;
	b=qEsBZWjIHSRHw9OKA92u9FUwOlOywcFeuvYzogebFSaqEBC/XWm5Ud6d2jqC9JPGef
	mdmHtI8BLOYPAIY32zy3yXXJIF+ngG46LAvu69PLqTO4lGPp9mRERsrxF/K5dY+0ryE6
	jRja6jTsKorJjbZxx8jLU1oiE8sXTpRH2cE0Er6AS42XUbb9yIjCUSKK4SFE2YmcOFeh
	05I+mjezYqERCK5/oiLzYBSIp5kwI8NLeeGSECPKANZSvDCnADgFJV1ixAjmAcwreujd
	YyZcmjjhcRLh58XMknHKQ38ppg5tVxi6TNIp3oMpWV1AdoSykg5/eNzorwdT6X3CO+VC
	khqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dYpnDQuOoYLiPdPW3Vt29p4f8JYOayADXMQxvtlPfEw=;
	b=kplhcLsVoXmTx0wTuZOkkU7awh1o77s+pHcevloSTl2+2AdeEdR7lvQBlgdAagWL5V
	zpQpCWUNb6zx/q7euDnWb3+BMREagvyGxqGI4GaB37uQjka74aMB0xsLuMjAiL0bRRjF
	iHCDBFD0kkKNk6hsbI6oAys95qF9Pt+ZRB2Aq0o9cmB9CSSy3xR0EoqgYjwjUl5zwckH
	82EiAyJI5Yvts2HCYie02TdFJRxRqJDEtr/Ejdn99fQl7sgibz1MX0aWcQQBoEoc7l/7
	CizFaoaZAv5lgYaU0bQCE/qOVue4ck1QkV0A7aR04ne2/e+IvGVK4BBLPG1JUrQ+V+4x
	RxpQ==
X-Gm-Message-State: AOPr4FUOaFsLHsQhUHx01/d9Do9viyqCpQ2gbsJGArH6GAkvkbKdFTsNDy1F7W+qmEDGIQ==
X-Received: by 10.194.86.200 with SMTP id r8mr15695026wjz.158.1463149851175;
	Fri, 13 May 2016 07:30:51 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	r5sm18873931wjy.37.2016.05.13.07.30.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 May 2016 07:30:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 May 2016 16:31:39 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160513143139.GA2565@jama>
References: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
	<5732CFA3.7080302@windriver.com> <57330B87.5080300@gmail.com>
MIME-Version: 1.0
In-Reply-To: <57330B87.5080300@gmail.com>
User-Agent: Mutt/1.6.1 (2016-04-27)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [master][krogoth][PATCH] openssl: Security fix via update to 1.0.2h
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
X-List-Received-Date: Fri, 13 May 2016 14:30:52 -0000
X-Groupsio-MsgNum: 82061
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wac7ysb48OaltWcw"
Content-Disposition: inline

--wac7ysb48OaltWcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 11, 2016 at 03:37:59AM -0700, akuster808 wrote:
> Robert,
>=20
>=20
> On 05/10/2016 11:22 PM, Robert Yang wrote:
> >=20
> >=20
> > On 05/04/2016 07:46 AM, Armin Kuster wrote:
> >> From: Armin Kuster <akuster@mvista.com>
> >>
> >> CVE-2016-2105
> >> CVE-2016-2106
> >> CVE-2016-2109
> >> CVE-2016-2176
> >>
> >> https://www.openssl.org/news/secadv/20160503.txt
> >>
> >> fixup openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch
> >>
> >> drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in latest.
> >=20
> > After I looked into the code, it seems that this patch is not in latest
> > code ?
>=20
> hmm, my old eyes deceive me.
>=20
> thanks for checking.
>=20
> I will send a correcting.

1.0.2h is already in fido, jethro and master, can we quickly get it to krog=
oth
which is still using older version 1.0.2g?

It's always strange to see recipe version downgrades when upgrading to
newer Yocto release.

> - armin
> > It is a backported patch from gentoo.
> >=20
> > // Robert
> >=20
> >>
> >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> >> ---
> >>   ...oid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch | 14
> >> +++++++-------
> >>   .../openssl/{openssl_1.0.2g.bb =3D> openssl_1.0.2h.bb}       |  6 ++=
----
> >>   2 files changed, 9 insertions(+), 11 deletions(-)
> >>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb =3D>
> >> openssl_1.0.2h.bb} (91%)
> >>
> >> diff --git
> >> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer=
-dereference-in-EVP_DigestInit_ex.patch
> >> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer=
-dereference-in-EVP_DigestInit_ex.patch
> >>
> >> index cebc8cf..f736e5c 100644
> >> ---
> >> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer=
-dereference-in-EVP_DigestInit_ex.patch
> >>
> >> +++
> >> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer=
-dereference-in-EVP_DigestInit_ex.patch
> >>
> >> @@ -8,16 +8,16 @@
> >> http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
> >>
> >>   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> >>   ---
> >> -Index: openssl-1.0.2/crypto/evp/digest.c
> >> +Index: openssl-1.0.2h/crypto/evp/digest.c
> >>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> ---- openssl-1.0.2.orig/crypto/evp/digest.c
> >> -+++ openssl-1.0.2/crypto/evp/digest.c
> >> -@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> >> -         return 0;
> >> +--- openssl-1.0.2h.orig/crypto/evp/digest.c
> >> ++++ openssl-1.0.2h/crypto/evp/digest.c
> >> +@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> >> +         type =3D ctx->digest;
> >>        }
> >>    #endif
> >>   -    if (ctx->digest !=3D type) {
> >>   +    if (type && (ctx->digest !=3D type)) {
> >> -         if (ctx->digest && ctx->digest->ctx_size)
> >> +         if (ctx->digest && ctx->digest->ctx_size) {
> >>                OPENSSL_free(ctx->md_data);
> >> -         ctx->digest =3D type;
> >> +             ctx->md_data =3D NULL;
> >> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> >> b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> >> similarity index 91%
> >> rename from meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> >> rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> >> index 290f129..ae65992 100644
> >> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> >> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> >> @@ -34,15 +34,13 @@ SRC_URI +=3D "file://find.pl;subdir=3D${BP}/util/ \
> >>               file://openssl-fix-des.pod-error.patch \
> >>               file://Makefiles-ptest.patch \
> >>               file://ptest-deps.patch \
> >> -            file://crypto_use_bigint_in_x86-64_perl.patch \
> >>               file://openssl-1.0.2a-x32-asm.patch \
> >>               file://ptest_makefile_deps.patch  \
> >>               file://configure-musl-target.patch \
> >>               file://parallel.patch \
> >>              "
> >> -
> >> -SRC_URI[md5sum] =3D "f3c710c045cdee5fd114feb69feba7aa"
> >> -SRC_URI[sha256sum] =3D
> >> "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33"
> >> +SRC_URI[md5sum] =3D "9392e65072ce4b614c1392eefc1f23d0"
> >> +SRC_URI[sha256sum] =3D
> >> "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
> >>
> >>   PACKAGES =3D+ "${PN}-engines"
> >>   FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so ${libdir}/engine=
s"
> >>
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wac7ysb48OaltWcw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc12bkACgkQN1Ujt2V2gBwxkQCgrkAV76hClzWP5Q+tKBQqoxg1
ZP4An2wH2L41zPBL947w7TkXAdY4AYfv
=6UxY
-----END PGP SIGNATURE-----

--wac7ysb48OaltWcw--
