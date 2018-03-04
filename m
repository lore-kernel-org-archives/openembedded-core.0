Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CBD79600EA
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Mar 2018 14:15:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id a20so9517318wmd.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Mar 2018 06:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=iOG65aFy5451JbgqaIRHIzcLHq6zztmU4r23k9QaG58=;
	b=YpiTmns3lxsA3i2eXrHp38YNtOy2n1V0PBZVV/Zv4Hp6U9EGwgF0y9E452+XVk6Cr8
	6+PvSLyuw5SymaPIBJVXj2c8yEEA02F7wxZjBX2ommWwHyB09JSXRYHv6jzZQ6TeTHIF
	vl0BxTUrC3rtwDqdu1l0udHPoQK/OsTrwpL0fGqPS6u4AXBEHFFEnGIo8i0Y2yEcGvQn
	/Mp811ge9y//UIGTDW/pucslL/OXpEu/E1zWPEoDnSepRj6r6I65t7HADevD8n6Ui1za
	yK+kl9pPeJaWOB733oH4OvbJj6XHjrlT3dusItEfxDVu6ZlRigokdf7nzriez06JkfhP
	kX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=iOG65aFy5451JbgqaIRHIzcLHq6zztmU4r23k9QaG58=;
	b=aw65XifbUrtpa1VOYaYNqPpiOgJ6UNIbPfLXI2khkt71GUMJoRpkCyGNzQBDBjN/f9
	9pOVzCiPeqGylPo0b03GFa8Zfg8cPuh2lvP/cV6or7YTT6m1o6kNC70tc6hXsWU87mmT
	062yFBRBvjvetLavw7rGU/Gr+0GAWKZzs539Vk65xgs8QIFSiKRaaxSURGwUYBXhYTkW
	uQit1Hwin4D7rMpEj7zSdEvU3LaDiTJm0ixhDd1NhrPxjsE5MyWkr5zbowssraPA3PmK
	Zxrv1UuolzqZigh6D+TnnmkzdUjLNa8EK1CtfOwQggDr3CBKywTfF3sNj/tZK+AHLZHW
	npCw==
X-Gm-Message-State: AElRT7GmTPkiOKXSlVkuDEcNJoSr9I9xbVK4N1lmUP2r05r7clngoAgj
	pnJD33XvAUo3UWoRekmFnLY=
X-Google-Smtp-Source: AG47ELtSRhqxJm4hhk5w6SQMIZhzwt1VbubUhtkyuIhWRhBNr8oBGF8ZitJ0t/x7jBOkfvdjE6oj0Q==
X-Received: by 10.28.114.8 with SMTP id n8mr5616907wmc.30.1520172936436;
	Sun, 04 Mar 2018 06:15:36 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	b45sm12346292wrb.79.2018.03.04.06.15.35
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 04 Mar 2018 06:15:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sun, 4 Mar 2018 15:15:38 +0100
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180304141538.GB1370@jama>
References: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1520162492-29839-1-git-send-email-richard.purdie@linuxfoundation.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][morty] gcc6: Upgrade to 6.4.0 (latest stable series release)
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
X-List-Received-Date: Sun, 04 Mar 2018 14:15:36 -0000
X-Groupsio-MsgNum: 108821
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline

--2B/JsCI69OhZNC5r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 04, 2018 at 11:21:32AM +0000, Richard Purdie wrote:
> From: Juro Bystricky <juro.bystricky@intel.com>
>=20
> Changed BINV and PV from 6.2.0 to 6.4.0
> Modified BASEURI to load xz tarball instead of bz2
>=20
> Backported series of patches from https://github.com/hjl-tools/gcc.git
> branch /hjl/indirect/gcc-6-branch/master which contains
> an IA patch series for security related issues
>=20
> ubsan-fix-check-empty-string.patch : removed, already applied

Very limited testing with this change in morty shows that raspberrypi3
(cortexa7hf-neon-vfpv4) build of glibc-initial fails with:

configure:5344: checking for broken __attribute__((alias()))
configure:5359: arm-oe-linux-gnueabi-gcc  -march=3Darmv7ve -marm
-mfpu=3Dneon-vfpv4  -mfloat-abi=3Dhard -mcpu=3Dcortex-a7
--sysroot=3Dsysroots/raspberrypi3-tcbootstrap
-Werror -S conftest.c -o conftest.s 1>&5
conftest.c:1:0: error: switch -mcpu=3Dcortex-a7 conflicts with
-march=3Darmv7ve switch [-Werror]
         extern int foo (int x) __asm ("xyzzy");

cc1: all warnings being treated as errors
configure:5362: $? =3D 1
configure:5372: result: yes
configure:5375: error: working alias attribute support required

Which is a bit strange as armv7ve was added to resolve this error with
-mcpu=3Dcortexa7 and -march=3Darmv7a in:

commit 35392025f3236f5e5393f9cf0857732da9a2e503
Author: Martin Jansa <Martin.Jansa@gmail.com>
Date:   Tue Oct 6 17:08:59 2015 +0200

    arch-armv7ve: add tune include for armv7ve and use it from cortexa7
and cortexa15
   =20
    * be aware that this -march value is available only in gcc-4.9 and
      newer:
      https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D57907
    * -mcpu=3Dcortex15 and -mcpu=3Dcortexa7 conflict with -march=3Darmv7a
      We either have to stop putting -march in default CCARGS or at
      least set it compatible one like this patch does.

Regards,

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWpv/iQAKCRA3VSO3ZXaA
HI7LAJ9U1b40pvG9q3nhmqtEqmBzrTVGTwCdEEB4+pXubfAobslC+uVqcUNlft4=
=TIUv
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--
