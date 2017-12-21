Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id D5D127887B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 19:39:32 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id t8so18034003wmc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 11:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=yMHIZBQ9l3mjffdWBnANdy0e6spwR4TxWeUReh9IagA=;
	b=c2mIjj+kmYHnhS9BdCs9zHIFkK9AVgarMJawZMItA5ZH9ETQOv9LlRjZDN3h66Jv+t
	u84JcJIBLHgmQq8HbQXE3ELa4HWEDqRddOhpo/olAMrrXcblTasorn9b7OJazRqXgiLZ
	hbW/zRL/WhO67zqXR7eqJ1tGonenU5dadgXog5CG8X0hohss6lFTHNJLpqPrpHsQ7O+v
	cdZxOw4CWGnLshgRfFb2uB0wwa5jUoT5b2EznM53Yc7bRbHWB2doaCGfjWMA0Z6K+H8M
	qIxFbMfbkLp2GZ7IwK/cZ+nRLrCTkYADsYuujKNskAg5jR27bdpVqpyfGiutN/YS/hWS
	3IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=yMHIZBQ9l3mjffdWBnANdy0e6spwR4TxWeUReh9IagA=;
	b=EzmIMEuQJv5kezcq1tLMEs5DkUjc8wUH07qejh6o+02fi/fgfe+qDyZ1B/P/LsotQd
	eBWiNhoLvhzBPngPe1nUas0XyUJ7sGm5bO7bGcREu3Mfk9j2Bh1pCdo/6qvfIaJS9yty
	00jAfKqTaEIPWGwniOmH6fY52dd6NWcgqd8pncOIALnaWEuJP0RcOYn1h2zY6xIxzNfu
	qbTrOzlsnGfvuIZI/XngiVmnixqsv4KDEHQ3iQ0+vPmm5ZeW96NpyH/JeBAGqkZUxgS2
	S8R9pK8gmdYkNip902JkRBWmJbHbSo0yiecdIqHhUsSf8c4FkwSdDKsW04kq6vSy1WDo
	93CA==
X-Gm-Message-State: AKGB3mLrdZ0yqx3NjgEH7EQB7BAlXRQKLdWI8C71uiVwOASR2DvRrM3/
	dzoTCoqoRjHPREvu9AFzddQ0YHtXKDY=
X-Google-Smtp-Source: ACJfBovjbXocyLOnWcbalniQ5uP59jx8K3JYnqlx5roHhXVmwp1hRLQVlxtfbppJZ8GZ7/vcoL/dFA==
X-Received: by 10.80.144.206 with SMTP id d14mr11212329eda.61.1513885173533;
	Thu, 21 Dec 2017 11:39:33 -0800 (PST)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id
	e29sm18180281edd.44.2017.12.21.11.39.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Dec 2017 11:39:32 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20171219212639.1553-4-stefan@agner.ch>
Date: Thu, 21 Dec 2017 20:39:30 +0100
Message-Id: <733F2207-9878-4242-BEF5-13E66DDD9F5C@dominion.thruhere.net>
References: <20171219212639.1553-1-stefan@agner.ch>
	<20171219212639.1553-4-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3445.5.20)
Cc: otavio@ossystems.com.br, Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH v3 4/4] openssl: fix runtime errors with Thumb2 when using binutils 2.29
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
X-List-Received-Date: Thu, 21 Dec 2017 19:39:33 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> Op 19 dec. 2017, om 22:26 heeft Stefan Agner <stefan@agner.ch> het =
volgende geschreven:
>=20
> From: Stefan Agner <stefan.agner@toradex.com>
>=20
> When compiling OpenSSL with binutils 2.29 for ARM with Thumb2 enabled
> crashes and unexpected behavior occurs. E.g. connecting to a OpenSSH
> server using the affected binary fails with:
>  ssh_dispatch_run_fatal: Connection to 192.168.10.171 port 22: =
incorrect signature
>=20
> Backport upstream bugfix:
> https://github.com/openssl/openssl/issues/4659
>=20
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

Tested-by: Koen Kooi <koen@dominion.thruhere.net>


> ---
> ...-armv4-bsaes-armv7-.pl-make-it-work-with-.patch | 88 =
++++++++++++++++++++++
> .../recipes-connectivity/openssl/openssl_1.1.0g.bb |  1 +
> 2 files changed, 89 insertions(+)
> create mode 100644 =
meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-arm=
v7-.pl-make-it-work-with-.patch
>=20
> diff --git =
a/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-a=
rmv7-.pl-make-it-work-with-.patch =
b/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-a=
rmv7-.pl-make-it-work-with-.patch
> new file mode 100644
> index 0000000000..bb0a1689ed
> --- /dev/null
> +++ =
b/meta/recipes-connectivity/openssl/openssl/0001-aes-asm-aes-armv4-bsaes-a=
rmv7-.pl-make-it-work-with-.patch
> @@ -0,0 +1,88 @@
> +=46rom bcc096a50811bf0f0c4fd34b2993fed7a7015972 Mon Sep 17 00:00:00 =
2001
> +From: Andy Polyakov <appro@openssl.org>
> +Date: Fri, 3 Nov 2017 23:30:01 +0100
> +Subject: [PATCH] aes/asm/{aes-armv4|bsaes-armv7}.pl: make it work =
with
> + binutils-2.29.
> +
> +It's not clear if it's a feature or bug, but binutils-2.29[.1]
> +interprets 'adr' instruction with Thumb2 code reference differently,
> +in a way that affects calculation of addresses of constants' tables.
> +
> +Upstream-Status: Backport
> +
> +Reviewed-by: Tim Hudson <tjh@openssl.org>
> +Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> +Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> +(Merged from https://github.com/openssl/openssl/pull/4669)
> +
> +(cherry picked from commit b82acc3c1a7f304c9df31841753a0fa76b5b3cda)
> +---
> + crypto/aes/asm/aes-armv4.pl   | 6 +++---
> + crypto/aes/asm/bsaes-armv7.pl | 6 +++---
> + 2 files changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/crypto/aes/asm/aes-armv4.pl =
b/crypto/aes/asm/aes-armv4.pl
> +index 16d79aae53..c6474b8aad 100644
> +--- a/crypto/aes/asm/aes-armv4.pl
> ++++ b/crypto/aes/asm/aes-armv4.pl
> +@@ -200,7 +200,7 @@ AES_encrypt:
> + #ifndef	__thumb2__
> + 	sub	r3,pc,#8		@ AES_encrypt
> + #else
> +-	adr	r3,AES_encrypt
> ++	adr	r3,.
> + #endif
> + 	stmdb   sp!,{r1,r4-r12,lr}
> + #ifdef	__APPLE__
> +@@ -450,7 +450,7 @@ _armv4_AES_set_encrypt_key:
> + #ifndef	__thumb2__
> + 	sub	r3,pc,#8		@ AES_set_encrypt_key
> + #else
> +-	adr	r3,AES_set_encrypt_key
> ++	adr	r3,.
> + #endif
> + 	teq	r0,#0
> + #ifdef	__thumb2__
> +@@ -976,7 +976,7 @@ AES_decrypt:
> + #ifndef	__thumb2__
> + 	sub	r3,pc,#8		@ AES_decrypt
> + #else
> +-	adr	r3,AES_decrypt
> ++	adr	r3,.
> + #endif
> + 	stmdb   sp!,{r1,r4-r12,lr}
> + #ifdef	__APPLE__
> +diff --git a/crypto/aes/asm/bsaes-armv7.pl =
b/crypto/aes/asm/bsaes-armv7.pl
> +index 9f288660ef..a27bb4a179 100644
> +--- a/crypto/aes/asm/bsaes-armv7.pl
> ++++ b/crypto/aes/asm/bsaes-armv7.pl
> +@@ -744,7 +744,7 @@ $code.=3D<<___;
> + .type	_bsaes_decrypt8,%function
> + .align	4
> + _bsaes_decrypt8:
> +-	adr	$const,_bsaes_decrypt8
> ++	adr	$const,.
> + 	vldmia	$key!, {@XMM[9]}		@ round 0 key
> + #ifdef	__APPLE__
> + 	adr	$const,.LM0ISR
> +@@ -843,7 +843,7 @@ _bsaes_const:
> + .type	_bsaes_encrypt8,%function
> + .align	4
> + _bsaes_encrypt8:
> +-	adr	$const,_bsaes_encrypt8
> ++	adr	$const,.
> + 	vldmia	$key!, {@XMM[9]}		@ round 0 key
> + #ifdef	__APPLE__
> + 	adr	$const,.LM0SR
> +@@ -951,7 +951,7 @@ $code.=3D<<___;
> + .type	_bsaes_key_convert,%function
> + .align	4
> + _bsaes_key_convert:
> +-	adr	$const,_bsaes_key_convert
> ++	adr	$const,.
> + 	vld1.8	{@XMM[7]},  [$inp]!		@ load round 0 key
> + #ifdef	__APPLE__
> + 	adr	$const,.LM0
> +--=20
> +2.15.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb =
b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
> index 5f3e9a9dfa..1649bffaa1 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
> @@ -18,6 +18,7 @@ SRC_URI =3D =
"http://www.openssl.org/source/openssl-${PV}.tar.gz \
>            file://openssl-c_rehash.sh \
>            file://0001-Take-linking-flags-from-LDFLAGS-env-var.patch \
>            =
file://0001-Remove-test-that-requires-running-as-non-root.patch \
> +           =
file://0001-aes-asm-aes-armv4-bsaes-armv7-.pl-make-it-work-with-.patch \
>           "
>=20
> S =3D "${WORKDIR}/openssl-${PV}"
> --=20
> 2.13.6
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


