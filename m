Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7731E788D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 19:39:37 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id f140so17847487wmd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 11:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=dImeT6a942THh4ga3x0cJeLYUJH/5lh+FhGoLoNFxlI=;
	b=NHfnYRk/BG6WXlYGAPJI9037/OQokCGPJZ14Jwv3fMBXfMTTaV8qfJgrX4ynysnSSW
	cwcDz0hEk7GrDrWZXN4RZls/0rB+sDo86C6ULqk9xMFXrn/gLOX5MvtK45fA798AH+Lm
	ldASUEU++BlcoRLHnppq64sqdnC7E0xxW6MUEXgnRUqnLX2YA9fSnaJhE7k/qsqeU3/9
	EePLuFpcN5goePSX84z4lNE7PNKmnxan8RzowJwD81N8uD6zim182EY/lKiB26JRoDiH
	vZzazyaUECBzu2nIx02i0GhmYpxz487JJW4Bl1XI2GaaTWMhJGpzswUC2VOMSwR2yAQt
	+w3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=dImeT6a942THh4ga3x0cJeLYUJH/5lh+FhGoLoNFxlI=;
	b=fMOgfk2dAg8nS51cOgvMC9FfxVNN6YweTBXcwRGZHs+bgqmMh15XszUEyEjbXo9d4y
	2ZbZidY9wtg+p0dOswQVsH8zX3m3GztLY6dPoIJ8hBREIt8EvZwqEOl32t2uI2D3EdZZ
	ftR08hW/sy7RzdF+0f9bkVa8a5TdZVeItgdzy5haRVF4G88GJZZdPBFGqijQ5/sPAVql
	gGCDAb87w1FbNp5DTTRLniQ9NwNU58Pvt7y6pGMR1kggM/Gsz1yDvJ5lGb3h08TYZ1YY
	4nWUHE2c26DmDZaQ4qWtozfY2BReca9rtWKH81oBzRCKcQPIB/bcUMpGKQ68s5PBlZyW
	cQEw==
X-Gm-Message-State: AKGB3mIIRYtjRVGPh7x7iQtvQVLQLtDYwVLpxedWwHTV180A4l0Q4vAL
	GOTE9r2zF++33f4qB0w6a3WYnw==
X-Google-Smtp-Source: ACJfBosR73xsoqhUgZOKw/HpwHhCae5zwwICTxrzQK/JSCFPaKK4uVitjxKkb0c77SijYKZyb1X6pg==
X-Received: by 10.80.136.49 with SMTP id b46mr11982638edb.155.1513885178183;
	Thu, 21 Dec 2017 11:39:38 -0800 (PST)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id
	e29sm18180281edd.44.2017.12.21.11.39.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Dec 2017 11:39:37 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20171219212639.1553-1-stefan@agner.ch>
Date: Thu, 21 Dec 2017 20:39:34 +0100
Message-Id: <EBE3E79B-E70F-4C73-B44A-23F86A07C2F7@dominion.thruhere.net>
References: <20171219212639.1553-1-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3445.5.20)
Cc: otavio@ossystems.com.br, Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH v3 1/4] openssl10: Upgrade 1.0.2l -> 1.0.2m
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
X-List-Received-Date: Thu, 21 Dec 2017 19:39:38 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Op 19 dec. 2017, om 22:26 heeft Stefan Agner <stefan@agner.ch> het =
volgende geschreven:
>=20
> From: Stefan Agner <stefan.agner@toradex.com>
>=20
> Deals with two CVEs:
> * bn_sqrx8x_internal carry bug on x86_64 (CVE-2017-3736)
> * Malformed X.509 IPAddressFamily could cause OOB read (CVE-2017-3735)
>=20
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Tested-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> Changes since v2:
> - Rebased to rocko-next
>=20
> .../0001-Fix-build-with-clang-using-external-assembler.patch          =
| 0
> .../0001-openssl-force-soft-link-to-avoid-rare-race.patch             =
| 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/Makefiles-ptest.patch =
 | 0
> .../Use-SHA256-not-MD5-as-default-digest.patch                        =
| 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/configure-musl-target.patch   =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/configure-targets.patch       =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/c_rehash-compat.patch  =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/ca.patch       =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/debian-targets.patch   =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/man-dir.patch  =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/man-section.patch      =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/no-rpath.patch =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/no-symbolic.patch      =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/pic.patch      =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/debian/version-script.patch   =
 | 0
> .../debian1.0.2/block_digicert_malaysia.patch                         =
| 0
> .../debian1.0.2/block_diginotar.patch                                 =
| 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/debian1.0.2/soname.patch      =
 | 0
> .../debian1.0.2/version-script.patch                                  =
| 0
> .../engines-install-in-libdir-ssl.patch                               =
| 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/find.pl               =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/oe-ldflags.patch      =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/openssl-1.0.2a-x32-asm.patch  =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/openssl-c_rehash.sh   =
 | 0
> .../openssl-fix-des.pod-error.patch                                   =
| 0
> .../openssl-util-perlpath.pl-cwd.patch                                =
| 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/openssl_fix_for_x32.patch     =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/parallel.patch        =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/ptest-deps.patch      =
 | 0
> .../{openssl-1.0.2l =3D> openssl-1.0.2m}/ptest_makefile_deps.patch     =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/run-ptest             =
 | 0
> .../openssl/{openssl-1.0.2l =3D> openssl-1.0.2m}/shared-libs.patch     =
 | 0
> .../openssl/{openssl_1.0.2l.bb =3D> openssl_1.0.2m.bb}                 =
 | 4 ++--
> 33 files changed, 2 insertions(+), 2 deletions(-)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/0001-Fix-build-with-clang-using-external-assembler.patch =
(100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/0001-openssl-force-soft-link-to-avoid-rare-race.patch =
(100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/Makefiles-ptest.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/Use-SHA256-not-MD5-as-default-digest.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/configure-musl-target.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/configure-targets.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/c_rehash-compat.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/ca.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/debian-targets.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/man-dir.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/man-section.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/no-rpath.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/no-symbolic.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/pic.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian/version-script.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian1.0.2/block_digicert_malaysia.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian1.0.2/block_diginotar.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian1.0.2/soname.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/debian1.0.2/version-script.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/engines-install-in-libdir-ssl.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/find.pl (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/oe-ldflags.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/openssl-1.0.2a-x32-asm.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/openssl-c_rehash.sh (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/openssl-fix-des.pod-error.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/openssl-util-perlpath.pl-cwd.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/openssl_fix_for_x32.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/parallel.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/ptest-deps.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/ptest_makefile_deps.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/run-ptest (100%)
> rename meta/recipes-connectivity/openssl/{openssl-1.0.2l =3D> =
openssl-1.0.2m}/shared-libs.patch (100%)
> rename meta/recipes-connectivity/openssl/{openssl_1.0.2l.bb =3D> =
openssl_1.0.2m.bb} (94%)
>=20
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-cla=
ng-using-external-assembler.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-cla=
ng-using-external-assembler.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-Fix-build-with-clang=
-using-external-assembler.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-Fix-build-with-clang=
-using-external-assembler.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft=
-link-to-avoid-rare-race.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-openssl-force-soft=
-link-to-avoid-rare-race.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/0001-openssl-force-soft-l=
ink-to-avoid-rare-race.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-openssl-force-soft-l=
ink-to-avoid-rare-race.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/Makefiles-ptest.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/Makefiles-ptest.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/Makefiles-ptest.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/Makefiles-ptest.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/Use-SHA256-not-MD5-as-d=
efault-digest.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/Use-SHA256-not-MD5-as-d=
efault-digest.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/Use-SHA256-not-MD5-as-def=
ault-digest.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/Use-SHA256-not-MD5-as-def=
ault-digest.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-musl-target.p=
atch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-musl-target.p=
atch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-musl-target.pat=
ch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-musl-target.pat=
ch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-targets.patch=
 =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-targets.patch=

> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/configure-targets.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/configure-targets.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/c_rehash-compat.=
patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/c_rehash-compat.=
patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/c_rehash-compat.pa=
tch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/c_rehash-compat.pa=
tch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/ca.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/ca.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/ca.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/ca.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/debian-targets.p=
atch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/debian-targets.p=
atch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/debian-targets.pat=
ch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/debian-targets.pat=
ch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-dir.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-dir.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-dir.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-dir.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-section.patc=
h =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-section.patc=
h
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/man-section.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/man-section.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-rpath.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-rpath.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-rpath.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-rpath.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-symbolic.patc=
h =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-symbolic.patc=
h
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/no-symbolic.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/no-symbolic.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/pic.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/pic.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/pic.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/pic.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/version-script.p=
atch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/version-script.p=
atch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian/version-script.pat=
ch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian/version-script.pat=
ch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_digic=
ert_malaysia.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_digic=
ert_malaysia.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_digicer=
t_malaysia.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_digicer=
t_malaysia.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_digin=
otar.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_digin=
otar.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/block_diginot=
ar.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/block_diginot=
ar.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/soname.patc=
h =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/soname.patc=
h
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/soname.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/soname.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/version-scr=
ipt.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/version-scr=
ipt.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/debian1.0.2/version-scrip=
t.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/debian1.0.2/version-scrip=
t.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/engines-install-in-libd=
ir-ssl.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/engines-install-in-libd=
ir-ssl.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/engines-install-in-libdir=
-ssl.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/engines-install-in-libdir=
-ssl.patch
> diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.2l/find.pl =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/find.pl
> similarity index 100%
> rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/find.pl
> rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/find.pl
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/oe-ldflags.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/oe-ldflags.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/oe-ldflags.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/oe-ldflags.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-1.0.2a-x32-asm.=
patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-1.0.2a-x32-asm.=
patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-1.0.2a-x32-asm.pa=
tch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-1.0.2a-x32-asm.pa=
tch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-c_rehash.sh =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-c_rehash.sh
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-c_rehash.sh
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-c_rehash.sh
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-fix-des.pod-err=
or.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-fix-des.pod-err=
or.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-fix-des.pod-error=
.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-fix-des.pod-error=
.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-util-perlpath.p=
l-cwd.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-util-perlpath.p=
l-cwd.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl-util-perlpath.pl-=
cwd.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl-util-perlpath.pl-=
cwd.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl_fix_for_x32.pat=
ch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl_fix_for_x32.pat=
ch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/openssl_fix_for_x32.patch=

> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/openssl_fix_for_x32.patch=

> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/parallel.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/parallel.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/parallel.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/parallel.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest-deps.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest-deps.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest-deps.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest-deps.patch
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest_makefile_deps.pat=
ch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest_makefile_deps.pat=
ch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/ptest_makefile_deps.patch=

> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/ptest_makefile_deps.patch=

> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/run-ptest =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/run-ptest
> similarity index 100%
> rename from meta/recipes-connectivity/openssl/openssl-1.0.2l/run-ptest
> rename to meta/recipes-connectivity/openssl/openssl-1.0.2m/run-ptest
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2l/shared-libs.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/shared-libs.patch
> similarity index 100%
> rename from =
meta/recipes-connectivity/openssl/openssl-1.0.2l/shared-libs.patch
> rename to =
meta/recipes-connectivity/openssl/openssl-1.0.2m/shared-libs.patch
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb =
b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
> similarity index 94%
> rename from meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
> index c537aa4cd0..04763ac346 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2l.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
> @@ -43,8 +43,8 @@ SRC_URI +=3D =
"file://find.pl;subdir=3Dopenssl-${PV}/util/ \
>             =
file://0001-Fix-build-with-clang-using-external-assembler.patch \
>             =
file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
>             "
> -SRC_URI[md5sum] =3D "f85123cd390e864dfbe517e7616e6566"
> -SRC_URI[sha256sum] =3D =
"ce07195b659e75f4e1db43552860070061f156a98bb37b672b101ba6e3ddf30c"
> +SRC_URI[md5sum] =3D "10e9e37f492094b9ef296f68f24a7666"
> +SRC_URI[sha256sum] =3D =
"8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
>=20
> PACKAGES =3D+ "${PN}-engines"
> FILES_${PN}-engines =3D "${libdir}/ssl/engines/*.so ${libdir}/engines"
> --=20
> 2.13.6
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


