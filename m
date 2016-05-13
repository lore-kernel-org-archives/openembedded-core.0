Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 23BDF731C8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 16:19:06 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r12so4673477wme.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2016 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=ssnCBAJVDfWgyyEidh5e7oWedKPRaq0Fd/JAkEbgIZg=;
	b=auhkOPrWxgdBIs/86k51S9saFjzNDHbwK0kHsBmrysLz4nZ2G4vHm0+2k0odpu12mf
	N8/ioGwwrpAvgoacnXRnZznMIU0hGA3uyAyq4Xw8z94F9cPR4TheIU5EqgFxYsqw2QE2
	Egfji5lClIsa2PzwFAMhiM2m/urbDWL2sdo1u9eny/KWpvJUfvqHgW/uBaSEIGz5Cvkq
	q4GFxmwglRC/eXpH6xwteO22deUS+zl8Ykvp3EaBTinledeq3TuXEg5GITrht+vbRvrW
	43PdBHbJtUoODnSVXs6a8yg9oIQQHeV505i9UdmcV3cexwgVJ7aeejKg+Mcn7QmBaBTu
	nMlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=ssnCBAJVDfWgyyEidh5e7oWedKPRaq0Fd/JAkEbgIZg=;
	b=Ol0bo1bfW7TFSzAvEEfTIxrmA1XhESs51DB6aUY2U+GMEI00r3q4QdsK/uitMzDAH0
	n27Kw224pKfz0Fd9NjmmWi9GrV50HreBtuaQTLLvyhaUHegc8nQGqNG4GhUsAT6MJdud
	3KiScP6Pn1EceT4hD0NVwxcdjQTH0Nasv6L9nscBGzI3252SIFGrHFs7i552dnwe/ZKY
	cIbaeTpXOV4ebF8eP4gspNOTCUQxHijf5CkoyXTFp1xhdhrjnyZ6R71W1ImCCWpA1qam
	M3DA9TDghytizYpnXDQVS2MSsMLXhLtUgxaKjLsn8pKbcYcMXOjEcC101nPMLlrAafCF
	7JrQ==
X-Gm-Message-State: AOPr4FW5ASEJkwlvzEINZmZJYGR8kqo3IttarcDs48l+q6UdC245xaGuqj3NGp62XdQ4kQ==
X-Received: by 10.194.76.137 with SMTP id k9mr16768467wjw.3.1463156346882;
	Fri, 13 May 2016 09:19:06 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	c4sm19368353wjm.24.2016.05.13.09.19.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 13 May 2016 09:19:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 13 May 2016 18:19:55 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20160513161955.GB2565@jama>
References: <1462319165-24307-1-git-send-email-akuster808@gmail.com>
	<5732CFA3.7080302@windriver.com> <57330B87.5080300@gmail.com>
	<20160513143139.GA2565@jama>
MIME-Version: 1.0
In-Reply-To: <20160513143139.GA2565@jama>
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
X-List-Received-Date: Fri, 13 May 2016 16:19:07 -0000
X-Groupsio-MsgNum: 82065
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fba/0zbH8Xs+Fj9o"
Content-Disposition: inline

--Fba/0zbH8Xs+Fj9o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 13, 2016 at 04:31:39PM +0200, Martin Jansa wrote:
> On Wed, May 11, 2016 at 03:37:59AM -0700, akuster808 wrote:
> > Robert,
> >=20
> >=20
> > On 05/10/2016 11:22 PM, Robert Yang wrote:
> > >=20
> > >=20
> > > On 05/04/2016 07:46 AM, Armin Kuster wrote:
> > >> From: Armin Kuster <akuster@mvista.com>
> > >>
> > >> CVE-2016-2105
> > >> CVE-2016-2106
> > >> CVE-2016-2109
> > >> CVE-2016-2176
> > >>
> > >> https://www.openssl.org/news/secadv/20160503.txt
> > >>
> > >> fixup openssl-avoid-NULL-pointer-dereference-in-EVP_DigestInit_ex.pa=
tch
> > >>
> > >> drop crypto_use_bigint_in_x86-64_perl.patch as that fix is in latest.
> > >=20
> > > After I looked into the code, it seems that this patch is not in late=
st
> > > code ?
> >=20
> > hmm, my old eyes deceive me.
> >=20
> > thanks for checking.
> >=20
> > I will send a correcting.
>=20
> 1.0.2h is already in fido, jethro and master, can we quickly get it to kr=
ogoth
> which is still using older version 1.0.2g?
>=20
> It's always strange to see recipe version downgrades when upgrading to
> newer Yocto release.

It also seems to break python-cryptography again:
http://errors.yoctoproject.org/Errors/Details/62854/

You have fixed compatibility with 1.0.2g in:
http://git.openembedded.org/meta-openembedded/commit/?id=3D44f0e74954628d6a=
3d04fa5249dbe0c94f6dff59

Maybe it needs another update for 1.0.2h and the same fix should be
backported to fido and jethro, now when they all have newer openssl as
well?

> > - armin
> > > It is a backported patch from gentoo.
> > >=20
> > > // Robert
> > >=20
> > >>
> > >> Signed-off-by: Armin Kuster <akuster@mvista.com>
> > >> ---
> > >>   ...oid-NULL-pointer-dereference-in-EVP_DigestInit_ex.patch | 14
> > >> +++++++-------
> > >>   .../openssl/{openssl_1.0.2g.bb =3D> openssl_1.0.2h.bb}       |  6 =
++----
> > >>   2 files changed, 9 insertions(+), 11 deletions(-)
> > >>   rename meta/recipes-connectivity/openssl/{openssl_1.0.2g.bb =3D>
> > >> openssl_1.0.2h.bb} (91%)
> > >>
> > >> diff --git
> > >> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-point=
er-dereference-in-EVP_DigestInit_ex.patch
> > >> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-point=
er-dereference-in-EVP_DigestInit_ex.patch
> > >>
> > >> index cebc8cf..f736e5c 100644
> > >> ---
> > >> a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-point=
er-dereference-in-EVP_DigestInit_ex.patch
> > >>
> > >> +++
> > >> b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-point=
er-dereference-in-EVP_DigestInit_ex.patch
> > >>
> > >> @@ -8,16 +8,16 @@
> > >> http://www.mail-archive.com/openssl-dev@openssl.org/msg32860.html
> > >>
> > >>   Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
> > >>   ---
> > >> -Index: openssl-1.0.2/crypto/evp/digest.c
> > >> +Index: openssl-1.0.2h/crypto/evp/digest.c
> > >>   =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >> ---- openssl-1.0.2.orig/crypto/evp/digest.c
> > >> -+++ openssl-1.0.2/crypto/evp/digest.c
> > >> -@@ -208,7 +208,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> > >> -         return 0;
> > >> +--- openssl-1.0.2h.orig/crypto/evp/digest.c
> > >> ++++ openssl-1.0.2h/crypto/evp/digest.c
> > >> +@@ -211,7 +211,7 @@ int EVP_DigestInit_ex(EVP_MD_CTX *ctx, c
> > >> +         type =3D ctx->digest;
> > >>        }
> > >>    #endif
> > >>   -    if (ctx->digest !=3D type) {
> > >>   +    if (type && (ctx->digest !=3D type)) {
> > >> -         if (ctx->digest && ctx->digest->ctx_size)
> > >> +         if (ctx->digest && ctx->digest->ctx_size) {
> > >>                OPENSSL_free(ctx->md_data);
> > >> -         ctx->digest =3D type;
> > >> +             ctx->md_data =3D NULL;
> > >> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> > >> b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> > >> similarity index 91%
> > >> rename from meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> > >> rename to meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> > >> index 290f129..ae65992 100644
> > >> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2g.bb
> > >> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2h.bb
> > >> @@ -34,15 +34,13 @@ SRC_URI +=3D "file://find.pl;subdir=3D${BP}/util=
/ \
> > >>               file://openssl-fix-des.pod-error.patch \
> > >>               file://Makefiles-ptest.patch \
> > >>               file://ptest-deps.patch \
> > >> -            file://crypto_use_bigint_in_x86-64_perl.patch \
> > >>               file://openssl-1.0.2a-x32-asm.patch \
> > >>               file://ptest_makefile_deps.patch  \
> > >>               file://configure-musl-target.patch \
> > >>               file://parallel.patch \
> > >>              "
> > >> -
> > >> -SRC_URI[md5sum] =3D "f3c710c045cdee5fd114feb69feba7aa"
> > >> -SRC_URI[sha256sum] =3D
> > >> "b784b1b3907ce39abf4098702dade6365522a253ad1552e267a9a0e89594aa33"
> > >> +SRC_URI[md5sum] =3D "9392e65072ce4b614c1392eefc1f23d0"
> > >> +SRC_URI[sha256sum] =3D
> > >> "1d4007e53aad94a5b2002fe045ee7bb0b3d98f1a47f8b2bc851dcd1c74332919"
> > >>
> > >>   PACKAGES =3D+ "${PN}-engines"
> > >>   FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so ${libdir}/engi=
nes"
> > >>
> > --=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fba/0zbH8Xs+Fj9o
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlc1/psACgkQN1Ujt2V2gBwVZwCgipVrqsy9Gbr3ZZtVGyxejdrB
mY8AoJPR/rIXGzjtX8eEQJqzoCyoFNW/
=/jTo
-----END PGP SIGNATURE-----

--Fba/0zbH8Xs+Fj9o--
