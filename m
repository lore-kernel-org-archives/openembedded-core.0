Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7052E60DFD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 14:17:02 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e51so422721eek.41
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2013 06:17:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=A3TEsSUxXmgKpZ/YT0pkN0h9KnpAOYmUfLBTYxOiX6U=;
	b=jYwbSPjwrogmny3RVKzYCoLOgFp7P6DOkFokqF9ooO16gBGvQamlS5luriB3iAVnfI
	CAzjzSp1WhUf6jpIvRDeH5kKyVA+LRnf/m/VztU/w1ZZvN1STTQb64Stp1Na3yUAFnk3
	W8FO8yPekCeOKLCQ3LMsBF/zgGlPGVs7It2Oty0zK/msxlANVAk99xHHmK62coRLmf2t
	uJ+Za8wTliZm3CH9l4cRTlsGmRU1YwN4YTn3lz/WSGYSCrE75KOorbA7yGIcG08/l7p0
	yWOv0xYSLpDIeFknZIBaSB4T/zfOmkYb53+gjazkxgxaiTZZvlDs8MNUkh/M5Yat4P4t
	SWzQ==
X-Gm-Message-State: ALoCoQmA2NZjl16BZm6Q0SHi1HgjF0gxNXTVU0a1GkJv7EOrWLZM4k1vDubFareK+vMschUeS5xc
X-Received: by 10.15.43.10 with SMTP id w10mr903095eev.13.1387462622537;
	Thu, 19 Dec 2013 06:17:02 -0800 (PST)
Received: from [172.20.0.102] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id m1sm9772302eeg.0.2013.12.19.06.17.00
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Dec 2013 06:17:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1387268915-28265-1-git-send-email-yasir_khan@mentor.com>
Date: Thu, 19 Dec 2013 15:17:01 +0100
Message-Id: <D5D9823C-BB5E-46C2-BCBC-C6728C34D67A@dominion.thruhere.net>
References: <1387268915-28265-1-git-send-email-yasir_khan@mentor.com>
To: Yasir Khan <yasir_khan@mentor.com>
X-Mailer: Apple Mail (2.1827)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] openssl.inc: Install c_rehash utility with openssl
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
X-List-Received-Date: Thu, 19 Dec 2013 14:17:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 dec. 2013, om 09:28 heeft Yasir Khan <yasir_khan@mentor.com> het =
volgende geschreven:

> From: mykhani <yasir_khan@mentor.com>
>=20
> c_rehash utility is not being installed with openssl.It conveniently
> generates hash and symbolic links based on it for CA certificates
> stored locally for SSL based server authentication
>=20
> Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
> ---
> meta/recipes-connectivity/openssl/openssl.inc |    7 ++++++-
> 1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc =
b/meta/recipes-connectivity/openssl/openssl.inc
> index 3bfe569..cdb1809 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -13,6 +13,9 @@ LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3Df9a8f968107345e0b75aa8c2ecaa7ec8"
>=20
> DEPENDS =3D "perl-native-runtime"
>=20
> +# Adding RDEPENDS for perl scripts
> +RDEPENDS_${PN}-misc +=3D"perl"

Does it need any perl-modules to function?

> +

R* variables go below do_install

> SRC_URI =3D "http://www.openssl.org/source/openssl-${PV}.tar.gz \
>           "
> S =3D "${WORKDIR}/openssl-${PV}"
> @@ -37,7 +40,7 @@ PACKAGES =3D+ "libcrypto libssl ${PN}-misc =
openssl-conf"
> FILES_libcrypto =3D "${base_libdir}/libcrypto${SOLIBS}"
> FILES_libssl =3D "${libdir}/libssl.so.*"
> FILES_${PN} =3D+ " ${libdir}/ssl/*"
> -FILES_${PN}-misc =3D "${libdir}/ssl/misc"
> +FILES_${PN}-misc =3D "${libdir}/ssl/misc ${bindir}/c_rehash"
> FILES_${PN}-dev +=3D "${base_libdir}/libcrypto${SOLIBSDEV}"

Same thing for FILES* variables, btw

>=20
> # Add the openssl.cnf file to the openssl-conf package.  Make the =
libcrypto
> @@ -157,6 +160,8 @@ do_install () {
> 	sed -i -e '1s,.*,#!${bindir}/env perl,' =
${D}${libdir}/ssl/misc/CA.pl
>=20
> 	oe_multilib_header openssl/opensslconf.h
> +	# The c_rehash utility isn't installed by the normal =
installation process.
> +	install -m 0755 ${S}/tools/c_rehash ${D}${bindir}
> }
>=20
> BBCLASSEXTEND =3D "native nativesdk"
> --=20
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20


