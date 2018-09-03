Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C35F5753D4
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Sep 2018 22:53:18 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id x6-v6so676068plv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2018 15:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=5DdbdTaQ0qtAnANRnYYxqpXfksTYoq1ihG15qnhBtgo=;
	b=YZHwZ0PPH6PoHuMzi0R2QpiaVrYir44uDzOxLh2bXLOlILQhrGiW7n1h3TJnKFA6LQ
	WZ1OvEttRwTC8zoXYMFzSfXyKJPTHFoKWuDcJNarvL4Pn+BJAKX328ms/tBE5b3fRpKy
	ONzq1yKLe9TMePwd/gJ/VLE0o9K8yraat0jaTMAy5n3I+JsfJ7db3Fmgo/bCCyT/G5ui
	bQIrg3ufxqShnOiGv03HJeXFyDhK6wQ7UXM+HHs5/wO1OvxKS3aBZyPbA0Fl4wxxTfta
	HVw4kKuoN9MnRe+bD8JueOL7GiCITg4E+9wofFglrcuAcBayK/Akk9jpNcOfTRMzDUzX
	XoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:organization:message-id:date:user-agent:mime-version:in-reply-to;
	bh=5DdbdTaQ0qtAnANRnYYxqpXfksTYoq1ihG15qnhBtgo=;
	b=cAOCEYceTRBtuOpcVgi1AqHxmlBGqvCqYT+zzvUgr/nCihO/WvMOEphghtCw0X8zCG
	BjOpDEMB4+hoOEmZaW5Z2xduzyAKAeU7+OdAfPBcnXMRko3Zi96G5+mQoV2AUcSdrEda
	FBTm97nUcA2V443IR3JPmjbLjttGn6FkGHrXd3n+sII8eaPefINeYVoVRfv4i1CFMP2P
	65ETidGkj5SaighyTv3s+UwQ8VydqTw1HgxWuo7fYHaOa/XroEdCvKqhbHhazzRa7lNg
	h2CFmPMAudaXXYRD57R/PMQmlwr96tcq62hT1laXHvIYwz3gHimBbKKAWZVsYsPSmXYg
	9Jbg==
X-Gm-Message-State: APzg51AJmmuvBAbwqs+aeEF3tR4n2MrSH8C/JjM2UgRCa4TqnNDnD+4H
	uoGK3zkNuFXr02PoYWHeK54OoxG/
X-Google-Smtp-Source: ANB0Vdafz13BKEVBCcsh5RKMwJZVcQeeq36iajHF5hBLc19tpw8/7xqNmDURe4PI/9vvWQfx34pKvg==
X-Received: by 2002:a17:902:8b86:: with SMTP id
	ay6-v6mr30877693plb.25.1536015199380; 
	Mon, 03 Sep 2018 15:53:19 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:d80a:932f:9324:e1fd])
	by smtp.gmail.com with ESMTPSA id
	a90-v6sm34718970pfg.106.2018.09.03.15.53.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Sep 2018 15:53:18 -0700 (PDT)
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1535451643.git.alex.kanavin@gmail.com>
	<010e93a91991128a31f1dd4e30c08e425f733ec4.1535451643.git.alex.kanavin@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=raj.khem@gmail.com; prefer-encrypt=mutual; keydata=
	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
Organization: HIMVIS LLC
Message-ID: <8e690a6b-467b-a25e-c5f0-5b29147fbb4f@gmail.com>
Date: Mon, 3 Sep 2018 15:53:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <010e93a91991128a31f1dd4e30c08e425f733ec4.1535451643.git.alex.kanavin@gmail.com>
Subject: Re: [RFC PATCH 3/6] openssl: update to 1.1.1
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
X-List-Received-Date: Mon, 03 Sep 2018 22:53:18 -0000
X-Groupsio-MsgNum: 115757
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="o8sDQRbk885Fvf8EePqDqwn4pFBjBuvv8"

--o8sDQRbk885Fvf8EePqDqwn4pFBjBuvv8
Content-Type: multipart/mixed; boundary="koM3NcAHoC3UjOFWnXxVWEJFs5XwiRgeE";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
 openembedded-core@lists.openembedded.org
Message-ID: <8e690a6b-467b-a25e-c5f0-5b29147fbb4f@gmail.com>
Subject: Re: [OE-core] [RFC PATCH 3/6] openssl: update to 1.1.1
References: <cover.1535451643.git.alex.kanavin@gmail.com>
 <010e93a91991128a31f1dd4e30c08e425f733ec4.1535451643.git.alex.kanavin@gmail.com>
In-Reply-To: <010e93a91991128a31f1dd4e30c08e425f733ec4.1535451643.git.alex.kanavin@gmail.com>

--koM3NcAHoC3UjOFWnXxVWEJFs5XwiRgeE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 8/28/18 3:23 AM, Alexander Kanavin wrote:
> At the moment 1.1.1 is in pre-release stage, however the final release
> should be available within a few weeks. The major selling point is that=

> it supports the new TLS 1.3 specification. It will also be the new long=

> term support version. More information:
>=20
> https://www.openssl.org/policies/releasestrat.html
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
>  ...1-Take-linking-flags-from-LDFLAGS-env-var.patch | 43 --------------=
--------
>  ...SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch | 39 --------------=
------
>  .../{openssl_1.1.0i.bb =3D> openssl_1.1.1-pre9.bb}   | 23 +++++++-----=

>  3 files changed, 14 insertions(+), 91 deletions(-)
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Take=
-linking-flags-from-LDFLAGS-env-var.patch
>  delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-allo=
w-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch
>  rename meta/recipes-connectivity/openssl/{openssl_1.1.0i.bb =3D> opens=
sl_1.1.1-pre9.bb} (83%)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Take-linkin=
g-flags-from-LDFLAGS-env-var.patch b/meta/recipes-connectivity/openssl/op=
enssl/0001-Take-linking-flags-from-LDFLAGS-env-var.patch
> deleted file mode 100644
> index 6ce4e47..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/0001-Take-linking-flags=
-from-LDFLAGS-env-var.patch
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -From 08face4353d80111973aba9c1304c92158cfad0e Mon Sep 17 00:00:00 2001=

> -From: Alexander Kanavin <alex.kanavin@gmail.com>
> -Date: Tue, 28 Mar 2017 16:40:12 +0300
> -Subject: [PATCH] Take linking flags from LDFLAGS env var
> -
> -This fixes "No GNU_HASH in the elf binary" issues.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ----
> - Configurations/unix-Makefile.tmpl | 2 +-
> - Configure                         | 2 +-
> - 2 files changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-M=
akefile.tmpl
> -index c029817..43b769b 100644
> ---- a/Configurations/unix-Makefile.tmpl
> -+++ b/Configurations/unix-Makefile.tmpl
> -@@ -173,7 +173,7 @@ CROSS_COMPILE=3D {- $config{cross_compile_prefix} =
-}
> - CC=3D $(CROSS_COMPILE){- $target{cc} -}
> - CFLAGS=3D{- our $cflags2 =3D join(" ",(map { "-D".$_} @{$target{defin=
es}}, @{$config{defines}}),"-DOPENSSLDIR=3D\"\\\"\$(OPENSSLDIR)\\\"\"","-=
DENGINESDIR=3D\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $c=
onfig{cflags} -}
> - CFLAGS_Q=3D{- $cflags2 =3D~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{=
cflags} -}
> --LDFLAGS=3D {- $target{lflags} -}
> -+LDFLAGS=3D {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
> - PLIB_LDFLAGS=3D {- $target{plib_lflags} -}
> - EX_LIBS=3D {- $target{ex_libs} -} {- $config{ex_libs} -}
> - LIB_CFLAGS=3D{- $target{shared_cflag} || "" -}
> -diff --git a/Configure b/Configure
> -index aee7cc3..274d236 100755
> ---- a/Configure
> -+++ b/Configure
> -@@ -979,7 +979,7 @@ $config{build_file} =3D $target{build_file};
> - $config{defines} =3D [];
> - $config{cflags} =3D "";
> - $config{ex_libs} =3D "";
> --$config{shared_ldflag} =3D "";
> -+$config{shared_ldflag} =3D $ENV{'LDFLAGS'};
> -=20
> - # Make sure build_scheme is consistent.
> - $target{build_scheme} =3D [ $target{build_scheme} ]
> ---=20
> -2.11.0
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENS=
SLDIR-and-ENGINESDIR-CFLAGS-to-be-control.patch b/meta/recipes-connectivi=
ty/openssl/openssl/0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-cont=
rol.patch
> deleted file mode 100644
> index 67d06fc..0000000
> --- a/meta/recipes-connectivity/openssl/openssl/0001-allow-OPENSSLDIR-a=
nd-ENGINESDIR-CFLAGS-to-be-control.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 26e98beb8a987cdc69699aaffc5599926fb1b293 Mon Sep 17 00:00:00 2001=

> -From: Andre McCurdy <armccurdy@gmail.com>
> -Date: Fri, 17 Aug 2018 20:33:44 -0700
> -Subject: [PATCH] allow OPENSSLDIR and ENGINESDIR CFLAGS to be controll=
ed
> -
> -Upstream-Status: Inappropriate [OE Specific]
> -
> -Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ----
> - Configurations/unix-Makefile.tmpl | 6 +++++-
> - 1 file changed, 5 insertions(+), 1 deletion(-)
> -
> -diff --git a/Configurations/unix-Makefile.tmpl b/Configurations/unix-M=
akefile.tmpl
> -index 034d93e..2310d12 100644
> ---- a/Configurations/unix-Makefile.tmpl
> -+++ b/Configurations/unix-Makefile.tmpl
> -@@ -156,6 +156,10 @@ LIBDIR=3D{- #
> - ENGINESDIR=3D{- use File::Spec::Functions;
> -               catdir($prefix,$libdir,"engines-$sover") -}
> -=20
> -+# Intermediate variables so the values defined via CFLAGS can be cont=
rolled.
> -+OE_DOPENSSLDIR=3D$(OPENSSLDIR)
> -+OE_DENGINESDIR=3D$(ENGINESDIR)
> -+
> - # Convenience variable for those who want to set the rpath in shared
> - # libraries and applications
> - LIBRPATH=3D$(INSTALLTOP)/$(LIBDIR)
> -@@ -174,7 +178,7 @@ HTMLSUFFIX=3Dhtml
> -=20
> - CROSS_COMPILE=3D {- $config{cross_compile_prefix} -}
> - CC=3D $(CROSS_COMPILE){- $target{cc} -}
> --CFLAGS=3D{- our $cflags2 =3D join(" ",(map { "-D".$_} @{$target{defin=
es}}, @{$config{defines}}),"-DOPENSSLDIR=3D\"\\\"\$(OPENSSLDIR)\\\"\"","-=
DENGINESDIR=3D\"\\\"\$(ENGINESDIR)\\\"\"") -} {- $target{cflags} -} {- $c=
onfig{cflags} -}
> -+CFLAGS=3D{- our $cflags2 =3D join(" ",(map { "-D".$_} @{$target{defin=
es}}, @{$config{defines}}),"-DOPENSSLDIR=3D\"\\\"\$(OE_DOPENSSLDIR)\\\"\"=
","-DENGINESDIR=3D\"\\\"\$(OE_DENGINESDIR)\\\"\"") -} {- $target{cflags} =
-} {- $config{cflags} -}
> - CFLAGS_Q=3D{- $cflags2 =3D~ s|([\\"])|\\$1|g; $cflags2 -} {- $config{=
cflags} -}
> - LDFLAGS=3D {- $target{lflags}." ".$ENV{'LDFLAGS'} -}
> - PLIB_LDFLAGS=3D {- $target{plib_lflags} -}
> ---=20
> -1.9.1
> -
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb b/meta=
/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> similarity index 83%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> index a03f6ff..1917c33 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0i.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1-pre9.bb
> @@ -13,26 +13,30 @@ DEPENDS =3D "hostperl-runtime-native"
>  SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>             file://run-ptest \
>             file://openssl-c_rehash.sh \
> -           file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \=

> -           file://0001-allow-OPENSSLDIR-and-ENGINESDIR-CFLAGS-to-be-co=
ntrol.patch \
>             "
> =20
>  SRC_URI_append_class-nativesdk =3D " \
>             file://environment.d-openssl.sh \
>             "
> =20
> -SRC_URI[md5sum] =3D "9495126aafd2659d357ea66a969c3fe1"
> -SRC_URI[sha256sum] =3D "ebbfc844a8c8cc0ea5dc10b86c9ce97f401837f3fa08c1=
7b2cdadc118253cf99"
> +SRC_URI[md5sum] =3D "6aa32e976e2c9a4aee858ced135d2573"
> +SRC_URI[sha256sum] =3D "95ebdfbb05e8451fb01a186ccaa4a7da0eff9a48999ede=
9fe1a7d90db75ccb4c"
> =20
>  inherit lib_package multilib_header ptest
> =20
>  #| ./libcrypto.so: undefined reference to `getcontext'
>  #| ./libcrypto.so: undefined reference to `setcontext'
>  #| ./libcrypto.so: undefined reference to `makecontext'
> -EXTRA_OECONF_append_libc-musl =3D " -DOPENSSL_NO_ASYNC"
> +CPPFLAGS_append_libc-musl =3D " -DOPENSSL_NO_ASYNC"

This change actually does not work. Correct way to disable async would
be to add -no-async option to configure, something like below works

EXTRA_OECONF_append_libc-musl =3D " -no-async"

Otherwise we get undefined refs to {get|set}context APIs encoded into
libcrypto.so





--koM3NcAHoC3UjOFWnXxVWEJFs5XwiRgeE--

--o8sDQRbk885Fvf8EePqDqwn4pFBjBuvv8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCW427WQAKCRC7BTNVkZ0z
FOAvAJ9fXSREycrx4NxtKDqVtxqwTg8MMQCghR9436SKtquIokC9rfXZjr8kt/Q=
=YCzP
-----END PGP SIGNATURE-----

--o8sDQRbk885Fvf8EePqDqwn4pFBjBuvv8--
