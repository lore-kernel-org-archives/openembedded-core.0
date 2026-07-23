Return-Path: <joaomarcos.costa@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F742C531D2
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 14:10:12 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24410.1784815803535478731
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jul 2026 07:10:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=Qo4O9KlQ;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4DDAE4E40F09
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 14:10:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AF63602B8;
	Thu, 23 Jul 2026 14:10:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C6BF511C10F0F;
	Thu, 23 Jul 2026 16:09:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784815800; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QBMLSqw3Kr2TCs/NkWG+XvzZECDdwdNnmeHJZi4DqRk=;
	b=Qo4O9KlQwlw3Ks1aAkk+Eh7DbGmV5u/xuKh9LzLNwvIoC2XWyjv700xECBYTwnXuDoPbos
	bj9lhCs0lXU8eAIeUwsrh52Q0ZLmUv1+OscMA/jdY17gRatuE5ZHCPcJVEXtgB0WwneeOg
	4D3WiGrm+91K8YvbNkEP7yiO4VR+hqe92blmN+gBfHOkzdziSdPhJm52Ia6ut9W7WJ/OTk
	9hGR8gLYS7z1QJxqKHTm9fv/yfGImui1UsiuNtLTlUKupYwdBnwH19BdvXQhx0eYSRXGAf
	cHik8sbDKggvtboj8S/Wsq1IkDyE8uY0tz1ThHclxxtPIz4bKhQ2yU/Bd0vRaw==
Message-ID: <240c270f-94d0-4e6b-b936-b6c808a63208@bootlin.com>
Date: Thu, 23 Jul 2026 16:09:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 1/3] curl: add option for libpsl, the Public
 Suffix List library
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20260723135515.1297700-1-ross.burton@arm.com>
Content-Language: en-US, fr
From: Joao Marcos Costa <joaomarcos.costa@bootlin.com>
Organization: Bootlin
In-Reply-To: <20260723135515.1297700-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jul 2026 14:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241847

Hello, Ross

On 7/23/26 15:55, Ross Burton via lists.openembedded.org wrote:
> Instead of hardcoding this to disabled, add a PACKAGECONFIG.
>=20
> No behavioural changes in this patch.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-support/curl/curl_8.21.0.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/curl/curl_8.21.0.bb b/meta/recipes-su=
pport/curl/curl_8.21.0.bb
> index d245e7fe60f..399b915dee8 100644
> --- a/meta/recipes-support/curl/curl_8.21.0.bb
> +++ b/meta/recipes-support/curl/curl_8.21.0.bb
> @@ -55,6 +55,7 @@ PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap=
,openldap"
>   PACKAGECONFIG[ldaps] =3D "--enable-ldaps,--disable-ldaps,openldap"
>   PACKAGECONFIG[libgsasl] =3D "--with-libgsasl,--without-libgsasl,libgs=
asl"
>   PACKAGECONFIG[libidn] =3D "--with-libidn2,--without-libidn2,libidn2"
> +PACKAGECONFIG[libpsl] =3D "--with-libpsl,--without-libpsl,libpsl"
>   PACKAGECONFIG[libssh] =3D "--with-libssh,--without-libssh,libssh"
>   PACKAGECONFIG[libssh2] =3D "--with-libssh2,--without-libssh2,libssh2"
>   PACKAGECONFIG[mbedtls] =3D "--with-mbedtls,--without-mbedtls,mbedtls"
> @@ -85,7 +86,6 @@ CURL_CA_BUNDLE_BASE_DIR:class-target =3D "${sysconfdi=
r}"
>  =20
>   EXTRA_OECONF =3D " \
>       --disable-libcurl-option \
> -    --without-libpsl \
>       --enable-optimize \
>       --with-ca-bundle=3D${CURL_CA_BUNDLE_BASE_DIR}/ssl/certs/ca-certif=
icates.crt \
>       ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls m=
bedtls openssl schannel', d) =3D=3D '') else ''} \


Coincidence or not, I just started checking this critical vulnerability:

https://nvd.nist.gov/vuln/detail/CVE-2026-8924

And it is directly related to libpsl. I presumed that having it disabled=20
(by default or not) would make oe-core's version of curl (e.g. in=20
Scarthgap and Kirkstone) not affected. In fact, I checked if the parts=20
of the code inside USE_LIBPSL ifdef blocks is built or not (it isn't),=20
and in do_configure logs:

curl version:     7.82.0
SSL:              enabled (OpenSSL v3+)
SSH:              no      (--with-{libssh,libssh2})
zlib:             enabled
brotli:           no      (--with-brotli)
zstd:             no      (--with-zstd)
GSS-API:          no      (--with-gssapi)
GSASL:            no      (--with-gsasl)
TLS-SRP:          enabled
resolver:         POSIX threaded
IPv6:             no      (--enable-ipv6)
Unix sockets:     enabled
IDN:              enabled (libidn2)
Build libcurl:    Shared=3Dyes, Static=3Dyes
Built-in manual:  no      (--enable-manual)
--libcurl option: no
Verbose errors:   enabled (--disable-verbose)
Code coverage:    disabled
SSPI:             no      (--enable-sspi)
ca cert bundle:   /etc/ssl/certs/ca-certificates.crt
ca cert path:     no
ca fallback:      no
LDAP:             no      (--enable-ldap / --with-ldap-lib /=20
--with-lber-lib)
LDAPS:            no      (--enable-ldaps)
RTSP:             no      (--enable-rtsp)
RTMP:             no      (--with-librtmp)
PSL:              no      (--with-libpsl)
(...)

I'm not sure yet if this is a premature conclusion of mine, but I'd=20
still want to give this heads-up, considered you added this option to=20
PACKAGECONFIG in your second patch.

--=20
Best regards,
Jo=C3=A3o Marcos Costa

