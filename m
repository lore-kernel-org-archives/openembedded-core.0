Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87764E7E644
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:56:04 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web10.21427.1695740157068218683
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:55:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yz7RsADI;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1dcbd8a56d6so4045845fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 07:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695740156; x=1696344956; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxaeEirJWQl4VUclFrCJGz3OLZYgxaUsVq7kTzY8YRI=;
        b=Yz7RsADIfWkg2b2KXFJk4arpaczscq8lL3sJuSaa4j2R/e+4Dvgewb3i9099BnfJ4T
         BxOXxzrIFiszBWiE0EGQ2lJ1PIu+RvMhNe6iv3WRCfpawRpx8u8btR1tkwqfijRDGz6T
         76pO+z9St9/iZ8EhDDSYSrF605fP8YE/+Oh9HJc5vDJN6AF+xs3C0B7bhPvZBYHhituc
         KjLRL0BryQ3nm3PH5bDqDy+DCXrodXnElS5eYJi3vt/qvWB+VKYSVYsQy3B2byO+dcL/
         8vZS633Ar0cUhT5cXhn/Fgo+BXLh6u1RPHwB0gXwjqeilGEq4aZi3BD7/T1QN/4lDKF4
         mTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695740156; x=1696344956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AxaeEirJWQl4VUclFrCJGz3OLZYgxaUsVq7kTzY8YRI=;
        b=uyPgU8oqk1VM3K1yYtNMkYpjG4aIgbyo5sgxWXJl5VpfYAH8RqMp7wVXVaSdFxZ53u
         /fxiussJ/qX8q+nn9an8fE8tVZeV8tnptB+1jbHicNkjEoKwe5LhbSNAi/Eu3SRzB2Xp
         NGgMUugvaXzeXnrPAmKzggtpKbo673f1xYzhB6CRT7FJyjDhv97/LeO/SPJAHq9hqew0
         baYhaQNqJhD84SVIRN0oeXhh5h38uvWvtXhiLniu+hjO5yxrjI7nDpoW0uUHZdfvyW2T
         IxsEnyzsPCzKiXUHoKUZyc16mVTVrC9Ok3olGImBzrr67oMMJKljKypzQhh68lDd9GV/
         nWVw==
X-Gm-Message-State: AOJu0Yw2sm6ykOg45bpXCtddOasV7svNekUMwCdaqrJowgStmJblzh1w
	GNzKJKabosL5utf3g1TQYGtuOdMikDuVjRwd6As=
X-Google-Smtp-Source: AGHT+IHasF6v1Ga/EJIbCZe8PvUpIoVWl0P2t7H2zlGT8KQy2KkwcGfXc4KoOQ9AwY+wwns5fHcYS8sdKeCb6YBJrgE=
X-Received: by 2002:a05:6871:294:b0:1ad:2e18:7090 with SMTP id
 i20-20020a056871029400b001ad2e187090mr13020923oae.32.1695740156101; Tue, 26
 Sep 2023 07:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230923172500.3425735-1-robert.joslyn@redrectangle.org>
In-Reply-To: <20230923172500.3425735-1-robert.joslyn@redrectangle.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Sep 2023 07:55:29 -0700
Message-ID: <CAMKF1so02nmDcYJHYodzU9Q7OzxU9VTjkJ6xp7gXhjWJOvdP3A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] curl: Update from 8.2.1 to 8.3.0
To: robert.joslyn@redrectangle.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:56:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188255

I am seeing a ptest failure on qemx86-64/glibc

  Failed ptests:
  {'curl': ['test_1474', 'curl']}

On Sat, Sep 23, 2023 at 10:25=E2=80=AFAM Robert Joslyn via
lists.openembedded.org
<robert.joslyn=3Dredrectangle.org@lists.openembedded.org> wrote:
>
> From: Robert Joslyn <robert.joslyn@redrectangle.org>
>
> NSS support was removed, so adjust PACKAGECONFIG options.
>
> The --enable-crypto-auth option was removed and split into separate
> options for basic-auth, bearer-auth, digest-auth, kerberos-auth,
> negotiate-auth, and aws. Enable these new options since upstream enables
> them by default.
>
> Disable test 1279 since this requires libcurl and hangs the tests.
>
> Signed-off-by: Robert Joslyn <robert.joslyn@redrectangle.org>
> ---
> Changes from v1:
> Enable aws authentication by default. Upstream enables it by default and
> test 1964 fails with it disabled.
>
>  meta/recipes-support/curl/curl/disable-tests       |  1 +
>  .../curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb}          | 14 +++++++++-----
>  2 files changed, 10 insertions(+), 5 deletions(-)
>  rename meta/recipes-support/curl/{curl_8.2.1.bb =3D> curl_8.3.0.bb} (88%=
)
>
> diff --git a/meta/recipes-support/curl/curl/disable-tests b/meta/recipes-=
support/curl/curl/disable-tests
> index b687b2bb76..fdac795662 100644
> --- a/meta/recipes-support/curl/curl/disable-tests
> +++ b/meta/recipes-support/curl/curl/disable-tests
> @@ -21,6 +21,7 @@
>  # This test is scanning the source tree
>  1222
>  # These CRL tests need --libcurl option to be enabled
> +1279
>  1400
>  1401
>  1402
> diff --git a/meta/recipes-support/curl/curl_8.2.1.bb b/meta/recipes-suppo=
rt/curl/curl_8.3.0.bb
> similarity index 88%
> rename from meta/recipes-support/curl/curl_8.2.1.bb
> rename to meta/recipes-support/curl/curl_8.3.0.bb
> index b86c6f3bba..646ac01914 100644
> --- a/meta/recipes-support/curl/curl_8.2.1.bb
> +++ b/meta/recipes-support/curl/curl_8.3.0.bb
> @@ -14,7 +14,7 @@ SRC_URI =3D " \
>      file://run-ptest \
>      file://disable-tests \
>  "
> -SRC_URI[sha256sum] =3D "dd322f6bd0a20e6cebdfd388f69e98c3d183bed792cf4713=
c8a7ef498cba4894"
> +SRC_URI[sha256sum] =3D "376d627767d6c4f05105ab6d497b0d9aba7111770dd9d995=
225478209c37ea63"
>
>  # Curl has used many names over the years...
>  CVE_PRODUCT =3D "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:l=
ibcurl daniel_stenberg:curl"
> @@ -24,21 +24,26 @@ inherit autotools pkgconfig binconfig multilib_header=
 ptest
>  # Entropy source for random PACKAGECONFIG option
>  RANDOM ?=3D "/dev/urandom"
>
> -PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} l=
ibidn openssl proxy random threaded-resolver verbose zlib"
> +PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} a=
ws basic-auth bearer-auth digest-auth negotiate-auth libidn openssl proxy r=
andom threaded-resolver verbose zlib"
>  PACKAGECONFIG:class-native =3D "ipv6 openssl proxy random threaded-resol=
ver verbose zlib"
>  PACKAGECONFIG:class-nativesdk =3D "ipv6 openssl proxy random threaded-re=
solver verbose zlib"
>
>  # 'ares' and 'threaded-resolver' are mutually exclusive
>  PACKAGECONFIG[ares] =3D "--enable-ares,--disable-ares,c-ares,,,threaded-=
resolver"
> +PACKAGECONFIG[aws] =3D "--enable-aws,--disable-aws"
> +PACKAGECONFIG[basic-auth] =3D "--enable-basic-auth,--disable-basic-auth"
> +PACKAGECONFIG[bearer-auth] =3D "--enable-bearer-auth,--disable-bearer-au=
th"
>  PACKAGECONFIG[brotli] =3D "--with-brotli,--without-brotli,brotli"
>  PACKAGECONFIG[builtinmanual] =3D "--enable-manual,--disable-manual"
>  # Don't use this in production
>  PACKAGECONFIG[debug] =3D "--enable-debug,--disable-debug"
>  PACKAGECONFIG[dict] =3D "--enable-dict,--disable-dict,"
> +PACKAGECONFIG[digest-auth] =3D "--enable-digest-auth,--disable-digest-au=
th"
>  PACKAGECONFIG[gnutls] =3D "--with-gnutls,--without-gnutls,gnutls"
>  PACKAGECONFIG[gopher] =3D "--enable-gopher,--disable-gopher,"
>  PACKAGECONFIG[imap] =3D "--enable-imap,--disable-imap,"
>  PACKAGECONFIG[ipv6] =3D "--enable-ipv6,--disable-ipv6,"
> +PACKAGECONFIG[kerberos-auth] =3D "--enable-kerberos-auth,--disable-kerbe=
ros-auth"
>  PACKAGECONFIG[krb5] =3D "--with-gssapi,--without-gssapi,krb5"
>  PACKAGECONFIG[ldap] =3D "--enable-ldap,--disable-ldap,openldap"
>  PACKAGECONFIG[ldaps] =3D "--enable-ldaps,--disable-ldaps,openldap"
> @@ -47,6 +52,7 @@ PACKAGECONFIG[libidn] =3D "--with-libidn2,--without-lib=
idn2,libidn2"
>  PACKAGECONFIG[libssh2] =3D "--with-libssh2,--without-libssh2,libssh2"
>  PACKAGECONFIG[mbedtls] =3D "--with-mbedtls=3D${STAGING_DIR_TARGET},--wit=
hout-mbedtls,mbedtls"
>  PACKAGECONFIG[mqtt] =3D "--enable-mqtt,--disable-mqtt,"
> +PACKAGECONFIG[negotiate-auth] =3D "--enable-negotiate-auth,--disable-neg=
otiate-auth"
>  PACKAGECONFIG[nghttp2] =3D "--with-nghttp2,--without-nghttp2,nghttp2"
>  PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
>  PACKAGECONFIG[pop3] =3D "--enable-pop3,--disable-pop3,"
> @@ -56,7 +62,6 @@ PACKAGECONFIG[rtmpdump] =3D "--with-librtmp,--without-l=
ibrtmp,rtmpdump"
>  PACKAGECONFIG[rtsp] =3D "--enable-rtsp,--disable-rtsp,"
>  PACKAGECONFIG[smb] =3D "--enable-smb,--disable-smb,"
>  PACKAGECONFIG[smtp] =3D "--enable-smtp,--disable-smtp,"
> -PACKAGECONFIG[nss] =3D "--with-nss,--without-nss,nss"
>  PACKAGECONFIG[telnet] =3D "--enable-telnet,--disable-telnet,"
>  PACKAGECONFIG[tftp] =3D "--enable-tftp,--disable-tftp,"
>  PACKAGECONFIG[threaded-resolver] =3D "--enable-threaded-resolver,--disab=
le-threaded-resolver,,,,ares"
> @@ -67,11 +72,10 @@ PACKAGECONFIG[zstd] =3D "--with-zstd,--without-zstd,z=
std"
>  EXTRA_OECONF =3D " \
>      --disable-libcurl-option \
>      --disable-ntlm-wb \
> -    --enable-crypto-auth \
>      --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.crt \
>      --without-libpsl \
>      --enable-optimize \
> -    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbed=
tls nss openssl', d) =3D=3D '') else ''} \
> +    ${@'--without-ssl' if (bb.utils.filter('PACKAGECONFIG', 'gnutls mbed=
tls openssl', d) =3D=3D '') else ''} \
>  "
>
>  do_install:append:class-target() {
> --
> 2.41.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#188152): https://lists.openembedded.org/g/openembedde=
d-core/message/188152
> Mute This Topic: https://lists.openembedded.org/mt/101543494/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

