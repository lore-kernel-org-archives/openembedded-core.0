Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id BAF147887B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 19:39:30 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id 64so17826456wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 11:39:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=nt+QvaGftNqlKKl8verbhxL4hPEaI84Zpdua/PpmN6Y=;
	b=0N7+FFDJ+LoZv42LB+UDKqD1ZLcQvB0wNwv1twupRsGq9mRzgPxEODBsOPQqwttnpb
	+AKcm/S6bV5kTh1RbZfbpIFnbqT1rPbAduklJ6dckPOZ+LMKI8dDuq7ByWdSgEdfcLDs
	L+t5AgpZd1y3j8cpUjoX7cAQP9pT0ahVVKN0c3XP3spM3p43LNzTBcm3hpjDRR4B20f9
	GvBbmCTgBWJPl4GwWRdIo0iVnbYIXLYL2inz7G5Xj1cWQNRd6Hx2YIrP+kBkDYoiMB8Z
	AFwCI5k+EpTGI6bTloSd8yTLmRuV7xF8E43eJ0VKtPEKurhSrKn+tQGatOD2UqlYDXF+
	IfIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=nt+QvaGftNqlKKl8verbhxL4hPEaI84Zpdua/PpmN6Y=;
	b=NjVGNVPgAxhSaNAqKgNcabIEf3yLIMFzBQH054hKX25/LMSrQ3orvVkOSMvszGajC8
	k8EPekWIsLeE1b3UK4VuAuWO81FvtCktF72zTUPXhrljaA55mcoFt7+2tLs0Hp24sEAq
	yONlaCDiE3Q7opMFjvNGj2yCskNcBA2vNH6liX4bx01Zj3EQ+t1oi/QHGvcx9N15Ot6y
	7jcKzOcYD2VBqRyATFZE+YlqG4WGtHib1JG6wgizvb12Zu46RhSQlf0eI77Ft+m1B3sb
	mFOGYQaXBSY9x/t8BNUDw2VkPnQK9woWmm0ipmtivNKaRRgLqYDQmCCSh0KBNPEGRpaP
	uvSA==
X-Gm-Message-State: AKGB3mL5z19T2LrKwOG4sYiKtAYAEJO78iHGlVIGYhN/cbcTw6+EE+Xo
	0k59jf/fSBOd2jvnUBnJ9FqMDw==
X-Google-Smtp-Source: ACJfBoubxFhLOB3BRgqq7BdVfMARzkdqhonNJgc5mrZIdkWFNkLb9K0ojuPts9/sPXfHH4BIXvhcpw==
X-Received: by 10.80.147.14 with SMTP id m14mr11689480eda.121.1513885171424;
	Thu, 21 Dec 2017 11:39:31 -0800 (PST)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id
	e29sm18180281edd.44.2017.12.21.11.39.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Dec 2017 11:39:30 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20171219212639.1553-2-stefan@agner.ch>
Date: Thu, 21 Dec 2017 20:39:28 +0100
Message-Id: <0534E037-D174-4FA3-9C02-8CB9B0A03728@dominion.thruhere.net>
References: <20171219212639.1553-1-stefan@agner.ch>
	<20171219212639.1553-2-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3445.5.20)
Cc: otavio@ossystems.com.br, Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH v3 2/4] openssl10: fix runtime errors with Thumb2 when using binutils 2.29
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
X-List-Received-Date: Thu, 21 Dec 2017 19:39:31 -0000
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
> ...saes-armv7-sha256-armv4-.pl-make-it-work-.patch | 100 =
+++++++++++++++++++++
> .../recipes-connectivity/openssl/openssl_1.0.2m.bb |   1 +
> 2 files changed, 101 insertions(+)
> create mode 100644 =
meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-armv=
7-sha256-armv4-.pl-make-it-work-.patch
>=20
> diff --git =
a/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-ar=
mv7-sha256-armv4-.pl-make-it-work-.patch =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-ar=
mv7-sha256-armv4-.pl-make-it-work-.patch
> new file mode 100644
> index 0000000000..2ce0320c49
> --- /dev/null
> +++ =
b/meta/recipes-connectivity/openssl/openssl-1.0.2m/0001-aes-armv4-bsaes-ar=
mv7-sha256-armv4-.pl-make-it-work-.patch
> @@ -0,0 +1,100 @@
> +=46rom d1d6c69b6fd25e71dbae67fad17b2c7737f6b2dc Mon Sep 17 00:00:00 =
2001
> +From: Andy Polyakov <appro@openssl.org>
> +Date: Sun, 5 Nov 2017 17:08:16 +0100
> +Subject: [PATCH] {aes-armv4|bsaes-armv7|sha256-armv4}.pl: make it =
work with
> + binutils-2.29
> +
> +It's not clear if it's a feature or bug, but binutils-2.29[.1]
> +interprets 'adr' instruction with Thumb2 code reference differently,
> +in a way that affects calculation of addresses of constants' tables.
> +
> +Upstream-Status: Backport
> +
> +Reviewed-by: Bernd Edlinger <bernd.edlinger@hotmail.de>
> +Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
> +Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> +(Merged from https://github.com/openssl/openssl/pull/4673)
> +---
> + crypto/aes/asm/aes-armv4.pl    | 6 +++---
> + crypto/aes/asm/bsaes-armv7.pl  | 6 +++---
> + crypto/sha/asm/sha256-armv4.pl | 2 +-
> + 3 files changed, 7 insertions(+), 7 deletions(-)
> +
> +diff --git a/crypto/aes/asm/aes-armv4.pl =
b/crypto/aes/asm/aes-armv4.pl
> +index 4f8917089f..c1b5e352d7 100644
> +--- a/crypto/aes/asm/aes-armv4.pl
> ++++ b/crypto/aes/asm/aes-armv4.pl
> +@@ -184,7 +184,7 @@ AES_encrypt:
> + #if __ARM_ARCH__<7
> + 	sub	r3,pc,#8		@ AES_encrypt
> + #else
> +-	adr	r3,AES_encrypt
> ++	adr	r3,.
> + #endif
> + 	stmdb   sp!,{r1,r4-r12,lr}
> + 	mov	$rounds,r0		@ inp
> +@@ -430,7 +430,7 @@ _armv4_AES_set_encrypt_key:
> + #if __ARM_ARCH__<7
> + 	sub	r3,pc,#8		@ AES_set_encrypt_key
> + #else
> +-	adr	r3,private_AES_set_encrypt_key
> ++	adr	r3,.
> + #endif
> + 	teq	r0,#0
> + #if __ARM_ARCH__>=3D7
> +@@ -952,7 +952,7 @@ AES_decrypt:
> + #if __ARM_ARCH__<7
> + 	sub	r3,pc,#8		@ AES_decrypt
> + #else
> +-	adr	r3,AES_decrypt
> ++	adr	r3,.
> + #endif
> + 	stmdb   sp!,{r1,r4-r12,lr}
> + 	mov	$rounds,r0		@ inp
> +diff --git a/crypto/aes/asm/bsaes-armv7.pl =
b/crypto/aes/asm/bsaes-armv7.pl
> +index 70b3f9656f..ec66b0502a 100644
> +--- a/crypto/aes/asm/bsaes-armv7.pl
> ++++ b/crypto/aes/asm/bsaes-armv7.pl
> +@@ -724,7 +724,7 @@ $code.=3D<<___;
> + .type	_bsaes_decrypt8,%function
> + .align	4
> + _bsaes_decrypt8:
> +-	adr	$const,_bsaes_decrypt8
> ++	adr	$const,.
> + 	vldmia	$key!, {@XMM[9]}		@ round 0 key
> + 	add	$const,$const,#.LM0ISR-_bsaes_decrypt8
> +=20
> +@@ -819,7 +819,7 @@ _bsaes_const:
> + .type	_bsaes_encrypt8,%function
> + .align	4
> + _bsaes_encrypt8:
> +-	adr	$const,_bsaes_encrypt8
> ++	adr	$const,.
> + 	vldmia	$key!, {@XMM[9]}		@ round 0 key
> + 	sub	$const,$const,#_bsaes_encrypt8-.LM0SR
> +=20
> +@@ -923,7 +923,7 @@ $code.=3D<<___;
> + .type	_bsaes_key_convert,%function
> + .align	4
> + _bsaes_key_convert:
> +-	adr	$const,_bsaes_key_convert
> ++	adr	$const,.
> + 	vld1.8	{@XMM[7]},  [$inp]!		@ load round 0 key
> + 	sub	$const,$const,#_bsaes_key_convert-.LM0
> + 	vld1.8	{@XMM[15]}, [$inp]!		@ load round 1 key
> +diff --git a/crypto/sha/asm/sha256-armv4.pl =
b/crypto/sha/asm/sha256-armv4.pl
> +index 4fee74d832..750216eb42 100644
> +--- a/crypto/sha/asm/sha256-armv4.pl
> ++++ b/crypto/sha/asm/sha256-armv4.pl
> +@@ -205,7 +205,7 @@ sha256_block_data_order:
> + #if __ARM_ARCH__<7
> + 	sub	r3,pc,#8		@ sha256_block_data_order
> + #else
> +-	adr	r3,sha256_block_data_order
> ++	adr	r3,.
> + #endif
> + #if __ARM_MAX_ARCH__>=3D7 && !defined(__KERNEL__)
> + 	ldr	r12,.LOPENSSL_armcap
> +--=20
> +2.15.0
> +
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb =
b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
> index 04763ac346..9270f52bc6 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.0.2m.bb
> @@ -42,6 +42,7 @@ SRC_URI +=3D =
"file://find.pl;subdir=3Dopenssl-${PV}/util/ \
>             file://Use-SHA256-not-MD5-as-default-digest.patch \
>             =
file://0001-Fix-build-with-clang-using-external-assembler.patch \
>             =
file://0001-openssl-force-soft-link-to-avoid-rare-race.patch  \
> +            =
file://0001-aes-armv4-bsaes-armv7-sha256-armv4-.pl-make-it-work-.patch \
>             "
> SRC_URI[md5sum] =3D "10e9e37f492094b9ef296f68f24a7666"
> SRC_URI[sha256sum] =3D =
"8c6ff15ec6b319b50788f42c7abc2890c08ba5a1cdcd3810eb9092deada37b0f"
> --=20
> 2.13.6
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


