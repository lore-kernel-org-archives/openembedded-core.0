Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id B48167C62D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 14:53:30 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id w2so17362116wrt.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Mar 2019 07:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EDdvJ3HEof8ENfXOIWACs6P+2cc3+wM/astt4nsYqeE=;
	b=Um1EmihtrTv4YGsSOh/FmRo972CiLfDxHEQXucY5EKyM2w0WZ4Ko4mK6h6qZd9aqwR
	d1ZxcVc1hWyO/8Q/n4WNlqqxU77qvsyA2zpC4zS+PuTCJVbtKu5oice9oRgfz9Xh178d
	Qxr5rtvROr5k7yG6y99pAnvq5kteKcUne7lmtqjiqdHyvZ6TrnYIRJmI3edbHKjB1Q6x
	uif/cFBVQQvlzL0K6+7Qpjw72//vmo57RRpnWC81SGKifQ8/dSwQG/dKm/ZfbyHxoVhE
	lvMaNLElwbGYBKuM4uBR6ppgOZlfhHS2It+N6dTdpdFfmgj/jWi3MISe8pVhS25ll9RX
	nLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=EDdvJ3HEof8ENfXOIWACs6P+2cc3+wM/astt4nsYqeE=;
	b=cJRSsLOnWUfSqeerpHgUWe2xcYoYSzyYG61Rk4ILBMrOYUehtBWuqhpNGBbzu56kNA
	oUzCcaPZNORfgodW1dM2m2+cjTlUMlAiH6ffeqUpKicUHPuA4zPToBdf3mWf/Cy3HImM
	VCGjOmNzrPrRBnFcYDVDM/M3ikusEyCybOmdkKs8isBK+PDL3ZETqcRt9cMn9vsENRiY
	Si0lnqCd4iVkh2TCQc48G1XfNmtv+e0FesYRyi5nCX3qfe/nBK2aq+FM90l5LGLEHpnQ
	Tqg1s5n3/wisztJParzr6R5I24dmkrYX1oG6/2ychDbxfqb8z1Wh/6styQBCmUewNQCg
	o5Tg==
X-Gm-Message-State: APjAAAXGCpCNvcFvCePA1NWQQT5aj/xazywkl69yaqwIxAQmynOHPT7W
	i6DiNP7ejUY+pVDt38O742I=
X-Google-Smtp-Source: APXvYqzgpcqp06H3oM+7f0hH4jcAxfyKis4qf664Lw55uzxjZS4a4wMDKoPM34R9a5AFD+Lk0yBlJg==
X-Received: by 2002:a5d:4e87:: with SMTP id e7mr6175352wru.161.1552920811595; 
	Mon, 18 Mar 2019 07:53:31 -0700 (PDT)
Received: from [172.18.182.189] ([46.183.103.8])
	by smtp.gmail.com with ESMTPSA id
	x17sm31115545wrd.95.2019.03.18.07.53.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 18 Mar 2019 07:53:30 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190318133618.4022-1-otavio@ossystems.com.br>
Date: Mon, 18 Mar 2019 15:53:28 +0100
Message-Id: <166926B2-31F9-4290-A4B8-1EC6486C7357@gmail.com>
References: <20190318133618.4022-1-otavio@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] openssl: Use the c_rehash shell re-implementation for target
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
X-List-Received-Date: Mon, 18 Mar 2019 14:53:31 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Apologies, but I still have to veto this. The concerns I expressed previousl=
y still stand.

The best course of action would be to work with the OpenSSL upstream to repl=
ace the utility with either C or shell version.

Alex

> On 18 Mar 2019, at 14.36, Otavio Salvador <otavio@ossystems.com.br> wrote:=

>=20
> We had a c_rehash shell re-implementation being used for the native
> package and there is no reason to not use it as well for the
> target. This allows it to be available without the need of perl being
> installed.
>=20
> This partially reverts OE-Core:d2b1a889ef (openssl: move c_rehash pkg
> to avoid perl dep) but still allows the removal of perl
> dependency.
>=20
> The respective re-implementation was already in use here at OE-Core by
> the OpenSSL 1.0 recipe (since 2016) and were removed from the target
> recipe during the upgrade to the 1.1 release. So it now aligns the
> native and target recipes.
>=20
> ,----
> | Author: Otavio Salvador <otavio@ossystems.com.br>
> | Date:   Mon May 23 17:45:25 2016 -0300
> |
> |     openssl: Add Shell-Script based c_rehash utility
> |
> |     The PLD Linux distribution has ported the c_rehash[1] utility from
> |     Perl to Shell-Script, allowing it to be shipped by default.
> |
> |     1. https://git.pld-linux.org/?p=3Dpackages/openssl.git;a=3Dblob;f=3D=
openssl-c_rehash.sh;h=3D0ea22637ee6dbce845a9e2caf62540aaaf5d0761
> |
> |     The OpenSSL upstream intends[2] to convert the utility for C
> |     however did not yet finished the conversion.
> |
> |     2. https://rt.openssl.org/Ticket/Display.html?id=3D2324
> |
> |     This patch adds this script and thus removed the Perl requirement
> |     for it.
> |
> |     Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> |     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> `----
>=20
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
> Changes in v2:
> - updated commit log
>=20
> .../openssl/openssl_1.1.1a.bb                    | 16 ++++++++--------
> 1 file changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/re=
cipes-connectivity/openssl/openssl_1.1.1a.bb
> index 4a626a4fcd..a6f920e15b 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -128,7 +128,13 @@ do_install () {
>=20
>    oe_multilib_header openssl/opensslconf.h
>=20
> -    # Create SSL structure for packages such as ca-certificates which
> +    # Install a custom version of c_rehash that can handle sysroots prope=
rly.
> +    # This version is used for example when installing ca-certificates du=
ring
> +    # image creation.
> +    install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehas=
h
> +    sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash=

> +
> +        # Create SSL structure for packages such as ca-certificates which=

>    # contain hard-coded paths to /etc/ssl. Debian does the same.
>    install -d ${D}${sysconfdir}/ssl
>    mv ${D}${libdir}/ssl-1.1/certs \
> @@ -149,12 +155,6 @@ do_install_append_class-native () {
>        SSL_CERT_DIR=3D${libdir}/ssl-1.1/certs \
>        SSL_CERT_FILE=3D${libdir}/ssl-1.1/cert.pem \
>        OPENSSL_ENGINES=3D${libdir}/ssl-1.1/engines
> -
> -    # Install a custom version of c_rehash that can handle sysroots prope=
rly.
> -    # This version is used for example when installing ca-certificates du=
ring
> -    # image creation.
> -    install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehas=
h
> -    sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash=

> }
>=20
> do_install_append_class-nativesdk () {
> @@ -196,7 +196,7 @@ FILES_libcrypto =3D "${libdir}/libcrypto${SOLIBS}"
> FILES_libssl =3D "${libdir}/libssl${SOLIBS}"
> FILES_openssl-conf =3D "${sysconfdir}/ssl/openssl.cnf"
> FILES_${PN}-engines =3D "${libdir}/engines-1.1"
> -FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc ${bindir}/c_rehash"
> +FILES_${PN}-misc =3D "${libdir}/ssl-1.1/misc"
> FILES_${PN} =3D+ "${libdir}/ssl-1.1/*"
> FILES_${PN}_append_class-nativesdk =3D " ${SDKPATHNATIVE}/environment-setu=
p.d/openssl.sh"
>=20
> --=20
> 2.21.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

