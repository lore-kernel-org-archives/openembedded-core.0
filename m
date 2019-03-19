Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
	[209.85.208.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8AEA07CE27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 15:48:03 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id d6so16456231eds.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 08:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+Ac2GiqIyZ9ksoRFxqrjZNHYpIHrzRaJ3Su4IneBsk8=;
	b=NRNoZFeu79aNOPf1uYppdPPwAOZPFI7QjkJFqr2wYBG26ZURJtDDqrQ0/uJuKCwFDr
	mENQ+Yfntr1Gw43UcTEu9TZkJtvY0HnGNF5laqMY0uDWqJGZjBVYAgWQXS3qRS8nQ4FW
	m0c3Wbk3atedvkCaz0RaJkX7lbHv7fZ89KKlbBIKE2u1isbkcQyKYM+USUz0g6xd8XIt
	qp1WHEIPlVQezL+PKuzQMyqiy3cD2Su0yKY001Pi2ASq2Gz15nrYeJyhkYrVKq4wV26W
	0m40qVE56Wn0z5W+prys07XdXAwkVZ46xrYaPifFjviqLOunSryXRY1CwpwA63W7vyDv
	k6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+Ac2GiqIyZ9ksoRFxqrjZNHYpIHrzRaJ3Su4IneBsk8=;
	b=CPHxlZrbkv3nG5MMpcTIBHNF5HM5qsaVm8GJCItL4SuVfXPZgr1WxU+Q7KHAMT9msZ
	xhqskzVTER2/rg+UM+RwiWdmy79qMy4RR95qt7IQX7KgNCgREe0Z6LfmaQYD2s/3iZ+I
	n5OBON3IZIEv0vlq7EkzXv/B6FZ5HUOWnulqu+jH8o4SRFke572DU1ziIBLg2yfgYStr
	Ab7+JGJJ37LMIXO1nJPVsZNTsrFK22xkdSYaa0AV3/cQSSPRHztVNspo7KWQHRU/Sq6U
	3RHMwIIqL4UjXBn4RVJcKjoMJQL3ZR/YfiQslEOONYo8vt7rI4OVWMVKCCZD65wZWXGp
	kGqw==
X-Gm-Message-State: APjAAAX51/Q2s0l3A1DTmO6ZeFRKlGm0++snsC7+ZPsZWsbKZO3bnI8D
	Srj0jQDhT6ObY6lHTsRLOmVqh2Pg2Ak=
X-Google-Smtp-Source: APXvYqxJvBeIGgn/9eJWmIuCdbH7IS7ObsIriglbwDuvhsf3qSiKTBPHiNbfnJDf3fyAAymCq6xH5g==
X-Received: by 2002:aa7:dd0a:: with SMTP id i10mr6864716edv.35.1553010484168; 
	Tue, 19 Mar 2019 08:48:04 -0700 (PDT)
Received: from [192.168.44.177] (vpn30.hotsplots.net. [185.46.137.15])
	by smtp.gmail.com with ESMTPSA id
	ay13sm3145643ejb.66.2019.03.19.08.48.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 08:48:03 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190319135347.27444-1-otavio@ossystems.com.br>
Date: Tue, 19 Mar 2019 16:48:02 +0100
Message-Id: <AC4C6292-ED8A-4C78-AFD9-578EAFA37326@gmail.com>
References: <20190319135347.27444-1-otavio@ossystems.com.br>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] openssl: Upgrade 1.1.1a -> 1.1.1b
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
X-List-Received-Date: Tue, 19 Mar 2019 15:48:03 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Openssl10 needs a similar update, can you do it please?

Alex

> On 19 Mar 2019, at 14.53, Otavio Salvador <otavio@ossystems.com.br> wrote:=

>=20
> License-Update: copyright years updated
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>=20
> .../openssl/{openssl_1.1.1a.bb =3D> openssl_1.1.1b.bb}        | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
> rename meta/recipes-connectivity/openssl/{openssl_1.1.1a.bb =3D> openssl_1=
.1.1b.bb} (96%)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/re=
cipes-connectivity/openssl/openssl_1.1.1b.bb
> similarity index 96%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
> index d03a225df8..57026596fa 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
> @@ -7,7 +7,7 @@ SECTION =3D "libs/network"
> # "openssl" here actually means both OpenSSL and SSLeay licenses apply
> # (see meta/files/common-licenses/OpenSSL to which "openssl" is SPDXLICENS=
EMAPped)
> LICENSE =3D "openssl"
> -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd57d511030c9d66ef5f5966bee5a7e=
ff"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd343e62fc9c833710bbbed25f27364=
c8"
>=20
> DEPENDS =3D "hostperl-runtime-native"
>=20
> @@ -22,8 +22,8 @@ SRC_URI_append_class-nativesdk =3D " \
>            file://environment.d-openssl.sh \
>            "
>=20
> -SRC_URI[md5sum] =3D "963deb2272d6be7d4c2458afd2517b73"
> -SRC_URI[sha256sum] =3D "fc20130f8b7cbd2fb918b2f14e2f429e109c31ddd0fb38fc5=
d71d9ffed3f9f41"
> +SRC_URI[md5sum] =3D "4532712e7bcc9414f5bce995e4e13930"
> +SRC_URI[sha256sum] =3D "5c557b023230413dfb0756f3137a13e6d726838ccd1430888=
ad15bfb2b43ea4b"
>=20
> inherit lib_package multilib_header ptest
>=20
> --=20
> 2.21.0
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

