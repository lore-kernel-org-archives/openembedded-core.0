Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8F9AC7888B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 19:39:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id g130so21632262wme.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Dec 2017 11:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dominion-thruhere-net.20150623.gappssmtp.com; s=20150623;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZgRQ8eMMaxApDb9I+qGFXkIHWok557zRkgk8KD/gwMQ=;
	b=yL5qn6fWpF8qDi3+a6MXUcun4ywsaMRvrCFxTwaTJ7iNope6LWOEM2GQ133br8Xlqi
	DPfjnsHfUe9QhEIpBj7gl+v4W6RFcirvphS0MRl6PVIlCA3j/fpA7TTpeCsRi6LkZlgg
	KsDOR6DHURPhZBKSZAJvx9vx/1TdXsdmS4OsokK+OHczWr2fGz6ySJ7UfTRpR1dJY0dU
	jTxqH0T8BC7dVDEYvtqHoDwd52xkQn/N38tVdPplnfYaoJ8RhWQDleTHNntwP3urj1fn
	0EjzKX0BzRJR5lFqHhItBsqO81Ydxx73qL9u5n1s0p6tcLCNDdf+OtIpKxX+lQaguDlN
	980A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=ZgRQ8eMMaxApDb9I+qGFXkIHWok557zRkgk8KD/gwMQ=;
	b=LvTwt+S4caS9ZhNy+tyvG1/VXRwpG+T5SEvRhdiLb4s7WD4IV+hfXSCxujLuqDxP8X
	kYiAZksiTuGvEAeDAQJPdx7J7nAXGng0JpX/pmVC3TAfwKp8GvFn5XnGmMsdDu+ZSn29
	cyFDZL75Wx0DTq0VtYdzwI5R4RPV1PYzkeqm+rS5g19nVO6CXS7LNEWeU65o7SRamCbj
	lVDvpT9JdTuW1xrx4JDCJzOQbmbnSEHNwCwKKs2aLRnt5JWE5+CZZdYaGaOMIIolmAzb
	C0+BWK6ICoxMKOmYjMzsPPoAbGi6yve+YmtuNMHrUITcWF0uIAsnen8lNxWIzBHaaZH4
	P2Bg==
X-Gm-Message-State: AKGB3mJEbm8FqpieasxpyYG2ibwJHRYAMTYQIBFso/ecCZHZOklObwbJ
	JQRFHSR+UesJEMvJXITRqnhRsw==
X-Google-Smtp-Source: ACJfBovcsekqlwPQoEuZZ/SENzdCi1U/eIs3M0svYjO2TsD0K05ScefRJYpwj+qjxW6zjoJdUAOU/w==
X-Received: by 10.80.178.195 with SMTP id p61mr11905324edd.113.1513885176511; 
	Thu, 21 Dec 2017 11:39:36 -0800 (PST)
Received: from [172.20.0.85] ([185.47.135.167])
	by smtp.gmail.com with ESMTPSA id
	e29sm18180281edd.44.2017.12.21.11.39.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 21 Dec 2017 11:39:35 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 11.2 \(3445.5.20\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20171219212639.1553-3-stefan@agner.ch>
Date: Thu, 21 Dec 2017 20:39:32 +0100
Message-Id: <BDEAF9D7-657E-4E0D-B7C0-EB861C70740D@dominion.thruhere.net>
References: <20171219212639.1553-1-stefan@agner.ch>
	<20171219212639.1553-3-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3445.5.20)
Cc: otavio@ossystems.com.br, Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH v3 3/4] openssl: Upgrade 1.1.0f -> 1.1.0g
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
X-List-Received-Date: Thu, 21 Dec 2017 19:39:35 -0000
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
> .../openssl/{openssl_1.1.0f.bb =3D> openssl_1.1.0g.bb}                 =
 | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> rename meta/recipes-connectivity/openssl/{openssl_1.1.0f.bb =3D> =
openssl_1.1.0g.bb} (96%)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb =
b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
> similarity index 96%
> rename from meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
> rename to meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
> index 711a95985a..5f3e9a9dfa 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.0f.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.0g.bb
> @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Dcae6da10f4ffd9703214776d2aabce32"
>=20
> BBCLASSEXTEND =3D "native nativesdk"
>=20
> -SRC_URI[md5sum] =3D "7b521dea79ab159e8ec879d2333369fa"
> -SRC_URI[sha256sum] =3D =
"12f746f3f2493b2f39da7ecf63d7ee19c6ac9ec6a4fcd8c229da8a522cb12765"
> +SRC_URI[md5sum] =3D "ba5f1b8b835b88cadbce9b35ed9531a6"
> +SRC_URI[sha256sum] =3D =
"de4d501267da39310905cb6dc8c6121f7a2cad45a7707f76df828fe1b85073af"
>=20
> SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>            file://run-ptest \
> --=20
> 2.13.6
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


