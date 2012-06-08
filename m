Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SctxY-0008A0-Tu
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 09:50:17 +0200
Received: by eaal1 with SMTP id l1so867242eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 00:39:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=M+L5GJU+sPWBrrG02rT6586olodQthlswKdy7LrcRrU=;
	b=DnBYkshMNzSh/gGeKx873wUdq2IQgfDbyNcYfD4npRIrL4zgkZUaELOP+PsfK76/yC
	+OOjn4/Gb4UC75A8QOIdEaJxLZPUzo8qeyAKKxHaVOlU3ZeuXe2UTgpXz7JB7OqTvaXz
	76BfAYKswRiCB5ohRyd1maib/lH+dHgmEF8nXYGjIBYH2M5iMCcQmyWInOLXp8wxvESh
	rKe5RQaZWriUKK+XHW8XvZbuQLTXy/B2q0rUtgHZMZMG2vPYILxRIcbYQHrvJ6GlXTY1
	zUEVuRSF7s1t4r0MlKSR4D4YzsMZeNX1OSKl7HvI+hQS2tPd0QAgYhDIQQiEK7Ux+rrw
	EIpw==
Received: by 10.14.127.136 with SMTP id d8mr3221903eei.159.1339141187211;
	Fri, 08 Jun 2012 00:39:47 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id y3sm19042822eem.16.2012.06.08.00.39.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 00:39:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1339117150-15442-1-git-send-email-sgw@linux.intel.com>
Date: Fri, 8 Jun 2012 09:39:42 +0200
Message-Id: <0DCEDF44-AD19-4718-92F2-4801F8268190@dominion.thruhere.net>
References: <1339117150-15442-1-git-send-email-sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlwPgOSVa34sP7vV9hpN12ZiVrkYpTpENPKf3bmuqOFQMkrWKBuYyppwDN4BtKKxH80JhkJ
Subject: Re: [PATCH] curl: enable ssl support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jun 2012 07:50:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 jun. 2012, om 02:59 heeft Saul Wold het volgende geschreven:

> This patch enables ssl support for curl to allow git to clone from
> https / ssl sites.
>=20
> [YOCTO #2532]
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-support/curl/curl_7.24.0.bb |    6 +++---
> 1 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/meta/recipes-support/curl/curl_7.24.0.bb =
b/meta/recipes-support/curl/curl_7.24.0.bb
> index 12e95c9..f0ae7f1 100644
> --- a/meta/recipes-support/curl/curl_7.24.0.bb
> +++ b/meta/recipes-support/curl/curl_7.24.0.bb
> @@ -5,10 +5,10 @@ SECTION =3D "console/network"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;beginline=3D7;md5=3D3a34942f4ae3fbf1a303160714e664ac"
>=20
> -DEPENDS =3D "zlib gnutls"
> +DEPENDS =3D "zlib gnutls openssl"
> DEPENDS_virtclass-native =3D "zlib-native"
> DEPENDS_virtclass-nativesdk =3D "zlib-nativesdk"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> SRC_URI =3D "http://curl.haxx.se/download/curl-${PV}.tar.bz2 \
>            file://noldlibpath.patch \
> @@ -20,7 +20,7 @@ SRC_URI[sha256sum] =3D =
"ebdb111088ff8b0e05b1d1b075e9f1608285e8105cc51e21caacf33d01
> inherit autotools pkgconfig binconfig
>=20
> EXTRA_OECONF =3D "--with-zlib=3D${STAGING_LIBDIR}/../ \
> -                --without-ssl \
> +		--with-ssl \
>                 --without-libssh2 \
> 		--with-random=3D/dev/urandom \
> 		--without-libidn \

I haven't looked at the complete recipe, but what is the ssl behaviour =
for the -native and -nativesdk versions?

regards,

Koen=


