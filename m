Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web08.2205.1608671857480862269
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Dec 2020 13:17:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D+CZqTyJ;
 spf=pass (domain: gmail.com, ip: 209.85.222.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f49.google.com with SMTP id y21so4810850uag.2
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Dec 2020 13:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UKpheNkoG9O1xzK6b8NLrVuvIU8zlMwDQN2NgF6CQfo=;
        b=D+CZqTyJERvD/sitKyfgw+/8zNYfOXf3dlzfiZlFdS5kfE7DitAh8vKlp8YbNxkN7L
         kDJOYKve5wQmv0vlAXDoXdjv46MNX2upto8plesWPcoJYiA7WS5uMDF1QDWBnYGoYbCM
         K6+70q09d3SzJQFMlsqG+Y/KTiLNPA7c5L6qQXRVz8LqzlYvz8/8lwbjeSd12OCrJusR
         rTFr/TC1qFwM1mbS8MPLlYwtZXcqRzLmqxQYsIYUx7dwSjDPfkomgjsLsuRhJ7fOC6f+
         nf73dCzYX9I8RiZlBYUAa2UapqomCgMKPS2l3gTxVL4gnqwhVEe/VcVljuPPm7GfWl6w
         +Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UKpheNkoG9O1xzK6b8NLrVuvIU8zlMwDQN2NgF6CQfo=;
        b=O/bN/7Ti94+ZK390iGk1+faeMzkkU81TW8nXi8t5zytNveVadY+m09TL0pixuCiPFd
         5vs6Akdlnz518WKu+gQx3tpXPZTz2eXsTT9qFfNl0DgxknTmPqknjCoK4NhGAj30buGG
         RVdYxWeX/Y30/BVQvDc1NN05Sp7YM/MJ97l6nSJ/cyT6z+iHiasBGLULkqSIPTuiFogM
         GPFagzbK9FA6czZSQURAOkO8YYrIEGdcmsPyBtUp0XdlURIAJa5nx4hev2kP6VGgmy8J
         ZonA46cbiMYp6ozYlqMVk2EcWHgVuK3eV3Z82X5UFTdim8VTFgXmWHxQcidt3qDhokdP
         0nkQ==
X-Gm-Message-State: AOAM532ip3X4+bk3WaGjakR2ItvcMWoe2xcKPO9F2JIFcF3dCWEcRv7Z
	Ie75pav8rhS8sLxDCCVuXJsYnAvCtN0wOdWaSRQ=
X-Google-Smtp-Source: ABdhPJyrtvooFulZctpJVzL1iHPVyC/09Iiqg0wiV+DUq3sG+KdM7V+vjG18FvLkLZ4cqaGjgnFv5l4e6GJp+sZrPm4=
X-Received: by 2002:ab0:113:: with SMTP id 19mr16809902uak.71.1608671856557;
 Tue, 22 Dec 2020 13:17:36 -0800 (PST)
MIME-Version: 1.0
References: <1608669208-49586-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
In-Reply-To: <1608669208-49586-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 22 Dec 2020 22:17:25 +0100
Message-ID: <CANNYZj-kdrEwHV-Z8oNU0ZDpZ79L-C=g7DQtixv3URztxVKP-w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] curl: Update 7.73.0 -> 7.74.0
To: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000009200c105b7141ab9"

--0000000000009200c105b7141ab9
Content-Type: text/plain; charset="UTF-8"

Please set up git to detect file renames, otherwise the patch is impossible
to review.

Alex

On Tue, 22 Dec 2020 at 21:33, Jamaluddin, Khairul Rohaizzat <
khairul.rohaizzat.jamaluddin@intel.com> wrote:

> From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com
> >
>
> update to version 7.74.0
>
> curl 7.74.0 hsts: add experimental support for Strict-Transport-Security
> with various bug fixes
>
> Reference:
> https://curl.se/changes.html#7_74_0
>
> update includes fix for CVE:
> CVE-2020-8284
> CVE-2020-8285
> CVE-2020-8286
>
> Signed-off-by: Khairul Rohaizzat Jamaluddin <
> khairul.rohaizzat.jamaluddin@intel.com>
> ---
>  meta/recipes-support/curl/curl_7.73.0.bb | 85
> --------------------------------
>  meta/recipes-support/curl/curl_7.74.0.bb | 85
> ++++++++++++++++++++++++++++++++
>  2 files changed, 85 insertions(+), 85 deletions(-)
>  delete mode 100644 meta/recipes-support/curl/curl_7.73.0.bb
>  create mode 100644 meta/recipes-support/curl/curl_7.74.0.bb
>
> diff --git a/meta/recipes-support/curl/curl_7.73.0.bb
> b/meta/recipes-support/curl/curl_7.73.0.bb
> deleted file mode 100644
> index 0f26b0f..0000000
> --- a/meta/recipes-support/curl/curl_7.73.0.bb
> +++ /dev/null
> @@ -1,85 +0,0 @@
> -SUMMARY = "Command line tool and library for client-side URL transfers"
> -HOMEPAGE = "http://curl.haxx.se/"
> -BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
> -SECTION = "console/network"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
> -
> -SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> -           file://0001-replace-krb5-config-with-pkg-config.patch \
> -"
> -
> -SRC_URI[sha256sum] =
> "cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dca4a29d88a4bee146d131"
> -
> -# Curl has used many names over the years...
> -CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl
> libcurl:libcurl daniel_stenberg:curl"
> -
> -inherit autotools pkgconfig binconfig multilib_header
> -
> -PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}
> gnutls libidn proxy threaded-resolver verbose zlib"
> -PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose
> zlib"
> -PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose
> zlib"
> -
> -# 'ares' and 'threaded-resolver' are mutually exclusive
> -PACKAGECONFIG[ares] =
> "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> -PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
> -PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
> -PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
> -PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
> -PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
> -PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
> -PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> -PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
> -PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
> -PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
> -PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
> -PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
> -PACKAGECONFIG[mbedtls] =
> "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
> -PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
> -PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
> -PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
> -PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
> -PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
> -PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
> -PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
> -PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
> -PACKAGECONFIG[ssl] = "--with-ssl
> --with-random=/dev/urandom,--without-ssl,openssl"
> -PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
> -PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
> -PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
> -PACKAGECONFIG[threaded-resolver] =
> "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
> -PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
> -PACKAGECONFIG[zlib] =
> "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
> -
> -EXTRA_OECONF = " \
> -    --disable-libcurl-option \
> -    --disable-ntlm-wb \
> -    --enable-crypto-auth \
> -    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> -    --without-libmetalink \
> -    --without-libpsl \
> -    --enable-debug \
> -    --enable-optimize \
> -    --disable-curldebug \
> -"
> -
> -do_install_append_class-target() {
> -       # cleanup buildpaths from curl-config
> -       sed -i \
> -           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> -           -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
> -           -e 's|${DEBUG_PREFIX_MAP}||g' \
> -           ${D}${bindir}/curl-config
> -}
> -
> -PACKAGES =+ "lib${BPN}"
> -
> -FILES_lib${BPN} = "${libdir}/lib*.so.*"
> -RRECOMMENDS_lib${BPN} += "ca-certificates"
> -
> -FILES_${PN} += "${datadir}/zsh"
> -
> -inherit multilib_script
> -MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"
> -
> -BBCLASSEXTEND = "native nativesdk"
> diff --git a/meta/recipes-support/curl/curl_7.74.0.bb
> b/meta/recipes-support/curl/curl_7.74.0.bb
> new file mode 100644
> index 0000000..873bbe8
> --- /dev/null
> +++ b/meta/recipes-support/curl/curl_7.74.0.bb
> @@ -0,0 +1,85 @@
> +SUMMARY = "Command line tool and library for client-side URL transfers"
> +HOMEPAGE = "http://curl.haxx.se/"
> +BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
> +SECTION = "console/network"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
> +
> +SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> +           file://0001-replace-krb5-config-with-pkg-config.patch \
> +"
> +
> +SRC_URI[sha256sum] =
> "0f4d63e6681636539dc88fa8e929f934cd3a840c46e0bf28c73be11e521b77a5"
> +
> +# Curl has used many names over the years...
> +CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl
> libcurl:libcurl daniel_stenberg:curl"
> +
> +inherit autotools pkgconfig binconfig multilib_header
> +
> +PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}
> gnutls libidn proxy threaded-resolver verbose zlib"
> +PACKAGECONFIG_class-native = "ipv6 proxy ssl threaded-resolver verbose
> zlib"
> +PACKAGECONFIG_class-nativesdk = "ipv6 proxy ssl threaded-resolver verbose
> zlib"
> +
> +# 'ares' and 'threaded-resolver' are mutually exclusive
> +PACKAGECONFIG[ares] =
> "--enable-ares,--disable-ares,c-ares,,,threaded-resolver"
> +PACKAGECONFIG[brotli] = "--with-brotli,--without-brotli,brotli"
> +PACKAGECONFIG[builtinmanual] = "--enable-manual,--disable-manual"
> +PACKAGECONFIG[dict] = "--enable-dict,--disable-dict,"
> +PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
> +PACKAGECONFIG[gopher] = "--enable-gopher,--disable-gopher,"
> +PACKAGECONFIG[imap] = "--enable-imap,--disable-imap,"
> +PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
> +PACKAGECONFIG[krb5] = "--with-gssapi,--without-gssapi,krb5"
> +PACKAGECONFIG[ldap] = "--enable-ldap,--disable-ldap,"
> +PACKAGECONFIG[ldaps] = "--enable-ldaps,--disable-ldaps,"
> +PACKAGECONFIG[libidn] = "--with-libidn2,--without-libidn2,libidn2"
> +PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
> +PACKAGECONFIG[mbedtls] =
> "--with-mbedtls=${STAGING_DIR_TARGET},--without-mbedtls,mbedtls"
> +PACKAGECONFIG[mqtt] = "--enable-mqtt,--disable-mqtt,"
> +PACKAGECONFIG[nghttp2] = "--with-nghttp2,--without-nghttp2,nghttp2"
> +PACKAGECONFIG[pop3] = "--enable-pop3,--disable-pop3,"
> +PACKAGECONFIG[proxy] = "--enable-proxy,--disable-proxy,"
> +PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
> +PACKAGECONFIG[rtsp] = "--enable-rtsp,--disable-rtsp,"
> +PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
> +PACKAGECONFIG[smtp] = "--enable-smtp,--disable-smtp,"
> +PACKAGECONFIG[ssl] = "--with-ssl
> --with-random=/dev/urandom,--without-ssl,openssl"
> +PACKAGECONFIG[nss] = "--with-nss,--without-nss,nss"
> +PACKAGECONFIG[telnet] = "--enable-telnet,--disable-telnet,"
> +PACKAGECONFIG[tftp] = "--enable-tftp,--disable-tftp,"
> +PACKAGECONFIG[threaded-resolver] =
> "--enable-threaded-resolver,--disable-threaded-resolver,,,,ares"
> +PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
> +PACKAGECONFIG[zlib] =
> "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
> +
> +EXTRA_OECONF = " \
> +    --disable-libcurl-option \
> +    --disable-ntlm-wb \
> +    --enable-crypto-auth \
> +    --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
> +    --without-libmetalink \
> +    --without-libpsl \
> +    --enable-debug \
> +    --enable-optimize \
> +    --disable-curldebug \
> +"
> +
> +do_install_append_class-target() {
> +       # cleanup buildpaths from curl-config
> +       sed -i \
> +           -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
> +           -e 's,--with-libtool-sysroot=${STAGING_DIR_TARGET},,g' \
> +           -e 's|${DEBUG_PREFIX_MAP}||g' \
> +           ${D}${bindir}/curl-config
> +}
> +
> +PACKAGES =+ "lib${BPN}"
> +
> +FILES_lib${BPN} = "${libdir}/lib*.so.*"
> +RRECOMMENDS_lib${BPN} += "ca-certificates"
> +
> +FILES_${PN} += "${datadir}/zsh"
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/curl-config"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.7.4
>
>
> 
>
>

--0000000000009200c105b7141ab9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please set up git to detect file renames, otherwise t=
he patch is impossible to review.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, 22 Dec 2020 at 21:33, Jamaluddin, Khairul Rohaizzat &lt;<a href=3D"ma=
ilto:khairul.rohaizzat.jamaluddin@intel.com">khairul.rohaizzat.jamaluddin@i=
ntel.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">From: Khairul Rohaizzat Jamaluddin &lt;<a href=3D"mailto:khairul.ro=
haizzat.jamaluddin@intel.com" target=3D"_blank">khairul.rohaizzat.jamaluddi=
n@intel.com</a>&gt;<br>
<br>
update to version 7.74.0<br>
<br>
curl 7.74.0 hsts: add experimental support for Strict-Transport-Security w=
ith various bug fixes<br>
<br>
Reference:<br>
<a href=3D"https://curl.se/changes.html#7_74_0" rel=3D"noreferrer" target=
=3D"_blank">https://curl.se/changes.html#7_74_0</a><br>
<br>
update includes fix for CVE:<br>
CVE-2020-8284<br>
CVE-2020-8285<br>
CVE-2020-8286<br>
<br>
Signed-off-by: Khairul Rohaizzat Jamaluddin &lt;<a href=3D"mailto:khairul.=
rohaizzat.jamaluddin@intel.com" target=3D"_blank">khairul.rohaizzat.jamalud=
din@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.73.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">curl_7.73.0.bb</a> | 85 ----------------------=
----------<br>
=C2=A0meta/recipes-support/curl/<a href=3D"http://curl_7.74.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">curl_7.74.0.bb</a> | 85 ++++++++++++++++++++++=
++++++++++<br>
=C2=A02 files changed, 85 insertions(+), 85 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-support/curl/<a href=3D"http://curl_=
7.73.0.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.73.0.bb</a><br>
=C2=A0create mode 100644 meta/recipes-support/curl/<a href=3D"http://curl_=
7.74.0.bb" rel=3D"noreferrer" target=3D"_blank">curl_7.74.0.bb</a><br>
<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.73.0.bb" r=
el=3D"noreferrer" target=3D"_blank">curl_7.73.0.bb</a> b/meta/recipes-suppo=
rt/curl/<a href=3D"http://curl_7.73.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">curl_7.73.0.bb</a><br>
deleted file mode 100644<br>
index 0f26b0f..0000000<br>
--- a/meta/recipes-support/curl/<a href=3D"http://curl_7.73.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">curl_7.73.0.bb</a><br>
+++ /dev/null<br>
@@ -1,85 +0,0 @@<br>
-SUMMARY =3D &quot;Command line tool and library for client-side URL trans=
fers&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://curl.haxx.se/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://curl.haxx.se/</a>&quot;<br>
-BUGTRACKER =3D &quot;<a href=3D"http://curl.haxx.se/mail/list.cgi?list=3D=
curl-tracker" rel=3D"noreferrer" target=3D"_blank">http://curl.haxx.se/mail=
/list.cgi?list=3Dcurl-tracker</a>&quot;<br>
-SECTION =3D &quot;console/network&quot;<br>
-LICENSE =3D &quot;MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2e9fb35867314fe31c6a4977e=
f7dd531&quot;<br>
-<br>
-SRC_URI =3D &quot;<a href=3D"https://curl.haxx.se/download/curl-$%7BPV%7D=
.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://curl.haxx.se/downloa=
d/curl-${PV}.tar.bz2</a> \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-replace-krb5-config-=
with-pkg-config.patch \<br>
-&quot;<br>
-<br>
-SRC_URI[sha256sum] =3D &quot;cf34fe0b07b800f1c01a499a6e8b2af548f6d0e044dc=
a4a29d88a4bee146d131&quot;<br>
-<br>
-# Curl has used many names over the years...<br>
-CVE_PRODUCT =3D &quot;haxx:curl haxx:libcurl curl:curl curl:libcurl libcu=
rl:libcurl daniel_stenberg:curl&quot;<br>
-<br>
-inherit autotools pkgconfig binconfig multilib_header<br>
-<br>
-PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;ipv6&#39;, d)} gnutls libidn proxy threaded-resolver verbose zlib&quot;=
<br>
-PACKAGECONFIG_class-native =3D &quot;ipv6 proxy ssl threaded-resolver ver=
bose zlib&quot;<br>
-PACKAGECONFIG_class-nativesdk =3D &quot;ipv6 proxy ssl threaded-resolver =
verbose zlib&quot;<br>
-<br>
-# &#39;ares&#39; and &#39;threaded-resolver&#39; are mutually exclusive<b=
r>
-PACKAGECONFIG[ares] =3D &quot;--enable-ares,--disable-ares,c-ares,,,threa=
ded-resolver&quot;<br>
-PACKAGECONFIG[brotli] =3D &quot;--with-brotli,--without-brotli,brotli&quo=
t;<br>
-PACKAGECONFIG[builtinmanual] =3D &quot;--enable-manual,--disable-manual&q=
uot;<br>
-PACKAGECONFIG[dict] =3D &quot;--enable-dict,--disable-dict,&quot;<br>
-PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls,--without-gnutls,gnutls&quo=
t;<br>
-PACKAGECONFIG[gopher] =3D &quot;--enable-gopher,--disable-gopher,&quot;<b=
r>
-PACKAGECONFIG[imap] =3D &quot;--enable-imap,--disable-imap,&quot;<br>
-PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,&quot;<br>
-PACKAGECONFIG[krb5] =3D &quot;--with-gssapi,--without-gssapi,krb5&quot;<b=
r>
-PACKAGECONFIG[ldap] =3D &quot;--enable-ldap,--disable-ldap,&quot;<br>
-PACKAGECONFIG[ldaps] =3D &quot;--enable-ldaps,--disable-ldaps,&quot;<br>
-PACKAGECONFIG[libidn] =3D &quot;--with-libidn2,--without-libidn2,libidn2&=
quot;<br>
-PACKAGECONFIG[libssh2] =3D &quot;--with-libssh2,--without-libssh2,libssh2=
&quot;<br>
-PACKAGECONFIG[mbedtls] =3D &quot;--with-mbedtls=3D${STAGING_DIR_TARGET},-=
-without-mbedtls,mbedtls&quot;<br>
-PACKAGECONFIG[mqtt] =3D &quot;--enable-mqtt,--disable-mqtt,&quot;<br>
-PACKAGECONFIG[nghttp2] =3D &quot;--with-nghttp2,--without-nghttp2,nghttp2=
&quot;<br>
-PACKAGECONFIG[pop3] =3D &quot;--enable-pop3,--disable-pop3,&quot;<br>
-PACKAGECONFIG[proxy] =3D &quot;--enable-proxy,--disable-proxy,&quot;<br>
-PACKAGECONFIG[rtmpdump] =3D &quot;--with-librtmp,--without-librtmp,rtmpdu=
mp&quot;<br>
-PACKAGECONFIG[rtsp] =3D &quot;--enable-rtsp,--disable-rtsp,&quot;<br>
-PACKAGECONFIG[smb] =3D &quot;--enable-smb,--disable-smb,&quot;<br>
-PACKAGECONFIG[smtp] =3D &quot;--enable-smtp,--disable-smtp,&quot;<br>
-PACKAGECONFIG[ssl] =3D &quot;--with-ssl --with-random=3D/dev/urandom,--wi=
thout-ssl,openssl&quot;<br>
-PACKAGECONFIG[nss] =3D &quot;--with-nss,--without-nss,nss&quot;<br>
-PACKAGECONFIG[telnet] =3D &quot;--enable-telnet,--disable-telnet,&quot;<b=
r>
-PACKAGECONFIG[tftp] =3D &quot;--enable-tftp,--disable-tftp,&quot;<br>
-PACKAGECONFIG[threaded-resolver] =3D &quot;--enable-threaded-resolver,--d=
isable-threaded-resolver,,,,ares&quot;<br>
-PACKAGECONFIG[verbose] =3D &quot;--enable-verbose,--disable-verbose&quot;=
<br>
-PACKAGECONFIG[zlib] =3D &quot;--with-zlib=3D${STAGING_LIBDIR}/../,--witho=
ut-zlib,zlib&quot;<br>
-<br>
-EXTRA_OECONF =3D &quot; \<br>
-=C2=A0 =C2=A0 --disable-libcurl-option \<br>
-=C2=A0 =C2=A0 --disable-ntlm-wb \<br>
-=C2=A0 =C2=A0 --enable-crypto-auth \<br>
-=C2=A0 =C2=A0 --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.=
crt \<br>
-=C2=A0 =C2=A0 --without-libmetalink \<br>
-=C2=A0 =C2=A0 --without-libpsl \<br>
-=C2=A0 =C2=A0 --enable-debug \<br>
-=C2=A0 =C2=A0 --enable-optimize \<br>
-=C2=A0 =C2=A0 --disable-curldebug \<br>
-&quot;<br>
-<br>
-do_install_append_class-target() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# cleanup buildpaths from curl-config<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--sysroot=3D${STAGING_=
DIR_TARGET},,g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--with-libtool-sysroot=
=
=3D${STAGING_DIR_TARGET},,g&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MAP}||g=
&#39; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${bindir}/curl-config<br>
-}<br>
-<br>
-PACKAGES =3D+ &quot;lib${BPN}&quot;<br>
-<br>
-FILES_lib${BPN} =3D &quot;${libdir}/lib*.so.*&quot;<br>
-RRECOMMENDS_lib${BPN} +=3D &quot;ca-certificates&quot;<br>
-<br>
-FILES_${PN} +=3D &quot;${datadir}/zsh&quot;<br>
-<br>
-inherit multilib_script<br>
-MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindir}/curl-config&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
diff --git a/meta/recipes-support/curl/<a href=3D"http://curl_7.74.0.bb" r=
el=3D"noreferrer" target=3D"_blank">curl_7.74.0.bb</a> b/meta/recipes-suppo=
rt/curl/<a href=3D"http://curl_7.74.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">curl_7.74.0.bb</a><br>
new file mode 100644<br>
index 0000000..873bbe8<br>
--- /dev/null<br>
+++ b/meta/recipes-support/curl/<a href=3D"http://curl_7.74.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">curl_7.74.0.bb</a><br>
@@ -0,0 +1,85 @@<br>
+SUMMARY =3D &quot;Command line tool and library for client-side URL trans=
fers&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://curl.haxx.se/" rel=3D"noreferrer" ta=
rget=3D"_blank">http://curl.haxx.se/</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"http://curl.haxx.se/mail/list.cgi?list=3D=
curl-tracker" rel=3D"noreferrer" target=3D"_blank">http://curl.haxx.se/mail=
/list.cgi?list=3Dcurl-tracker</a>&quot;<br>
+SECTION =3D &quot;console/network&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D2e9fb35867314fe31c6a4977e=
f7dd531&quot;<br>
+<br>
+SRC_URI =3D &quot;<a href=3D"https://curl.haxx.se/download/curl-$%7BPV%7D=
.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://curl.haxx.se/downloa=
d/curl-${PV}.tar.bz2</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-replace-krb5-config-=
with-pkg-config.patch \<br>
+&quot;<br>
+<br>
+SRC_URI[sha256sum] =3D &quot;0f4d63e6681636539dc88fa8e929f934cd3a840c46e0=
bf28c73be11e521b77a5&quot;<br>
+<br>
+# Curl has used many names over the years...<br>
+CVE_PRODUCT =3D &quot;haxx:curl haxx:libcurl curl:curl curl:libcurl libcu=
rl:libcurl daniel_stenberg:curl&quot;<br>
+<br>
+inherit autotools pkgconfig binconfig multilib_header<br>
+<br>
+PACKAGECONFIG ??=3D &quot;${@bb.utils.filter(&#39;DISTRO_FEATURES&#39;, &=
#39;ipv6&#39;, d)} gnutls libidn proxy threaded-resolver verbose zlib&quot;=
<br>
+PACKAGECONFIG_class-native =3D &quot;ipv6 proxy ssl threaded-resolver ver=
bose zlib&quot;<br>
+PACKAGECONFIG_class-nativesdk =3D &quot;ipv6 proxy ssl threaded-resolver =
verbose zlib&quot;<br>
+<br>
+# &#39;ares&#39; and &#39;threaded-resolver&#39; are mutually exclusive<b=
r>
+PACKAGECONFIG[ares] =3D &quot;--enable-ares,--disable-ares,c-ares,,,threa=
ded-resolver&quot;<br>
+PACKAGECONFIG[brotli] =3D &quot;--with-brotli,--without-brotli,brotli&quo=
t;<br>
+PACKAGECONFIG[builtinmanual] =3D &quot;--enable-manual,--disable-manual&q=
uot;<br>
+PACKAGECONFIG[dict] =3D &quot;--enable-dict,--disable-dict,&quot;<br>
+PACKAGECONFIG[gnutls] =3D &quot;--with-gnutls,--without-gnutls,gnutls&quo=
t;<br>
+PACKAGECONFIG[gopher] =3D &quot;--enable-gopher,--disable-gopher,&quot;<b=
r>
+PACKAGECONFIG[imap] =3D &quot;--enable-imap,--disable-imap,&quot;<br>
+PACKAGECONFIG[ipv6] =3D &quot;--enable-ipv6,--disable-ipv6,&quot;<br>
+PACKAGECONFIG[krb5] =3D &quot;--with-gssapi,--without-gssapi,krb5&quot;<b=
r>
+PACKAGECONFIG[ldap] =3D &quot;--enable-ldap,--disable-ldap,&quot;<br>
+PACKAGECONFIG[ldaps] =3D &quot;--enable-ldaps,--disable-ldaps,&quot;<br>
+PACKAGECONFIG[libidn] =3D &quot;--with-libidn2,--without-libidn2,libidn2&=
quot;<br>
+PACKAGECONFIG[libssh2] =3D &quot;--with-libssh2,--without-libssh2,libssh2=
&quot;<br>
+PACKAGECONFIG[mbedtls] =3D &quot;--with-mbedtls=3D${STAGING_DIR_TARGET},-=
-without-mbedtls,mbedtls&quot;<br>
+PACKAGECONFIG[mqtt] =3D &quot;--enable-mqtt,--disable-mqtt,&quot;<br>
+PACKAGECONFIG[nghttp2] =3D &quot;--with-nghttp2,--without-nghttp2,nghttp2=
&quot;<br>
+PACKAGECONFIG[pop3] =3D &quot;--enable-pop3,--disable-pop3,&quot;<br>
+PACKAGECONFIG[proxy] =3D &quot;--enable-proxy,--disable-proxy,&quot;<br>
+PACKAGECONFIG[rtmpdump] =3D &quot;--with-librtmp,--without-librtmp,rtmpdu=
mp&quot;<br>
+PACKAGECONFIG[rtsp] =3D &quot;--enable-rtsp,--disable-rtsp,&quot;<br>
+PACKAGECONFIG[smb] =3D &quot;--enable-smb,--disable-smb,&quot;<br>
+PACKAGECONFIG[smtp] =3D &quot;--enable-smtp,--disable-smtp,&quot;<br>
+PACKAGECONFIG[ssl] =3D &quot;--with-ssl --with-random=3D/dev/urandom,--wi=
thout-ssl,openssl&quot;<br>
+PACKAGECONFIG[nss] =3D &quot;--with-nss,--without-nss,nss&quot;<br>
+PACKAGECONFIG[telnet] =3D &quot;--enable-telnet,--disable-telnet,&quot;<b=
r>
+PACKAGECONFIG[tftp] =3D &quot;--enable-tftp,--disable-tftp,&quot;<br>
+PACKAGECONFIG[threaded-resolver] =3D &quot;--enable-threaded-resolver,--d=
isable-threaded-resolver,,,,ares&quot;<br>
+PACKAGECONFIG[verbose] =3D &quot;--enable-verbose,--disable-verbose&quot;=
<br>
+PACKAGECONFIG[zlib] =3D &quot;--with-zlib=3D${STAGING_LIBDIR}/../,--witho=
ut-zlib,zlib&quot;<br>
+<br>
+EXTRA_OECONF =3D &quot; \<br>
+=C2=A0 =C2=A0 --disable-libcurl-option \<br>
+=C2=A0 =C2=A0 --disable-ntlm-wb \<br>
+=C2=A0 =C2=A0 --enable-crypto-auth \<br>
+=C2=A0 =C2=A0 --with-ca-bundle=3D${sysconfdir}/ssl/certs/ca-certificates.=
crt \<br>
+=C2=A0 =C2=A0 --without-libmetalink \<br>
+=C2=A0 =C2=A0 --without-libpsl \<br>
+=C2=A0 =C2=A0 --enable-debug \<br>
+=C2=A0 =C2=A0 --enable-optimize \<br>
+=C2=A0 =C2=A0 --disable-curldebug \<br>
+&quot;<br>
+<br>
+do_install_append_class-target() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0# cleanup buildpaths from curl-config<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--sysroot=3D${STAGING_=
DIR_TARGET},,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s,--with-libtool-sysroot=
=
=3D${STAGING_DIR_TARGET},,g&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e &#39;s|${DEBUG_PREFIX_MAP}||g=
&#39; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}${bindir}/curl-config<br>
+}<br>
+<br>
+PACKAGES =3D+ &quot;lib${BPN}&quot;<br>
+<br>
+FILES_lib${BPN} =3D &quot;${libdir}/lib*.so.*&quot;<br>
+RRECOMMENDS_lib${BPN} +=3D &quot;ca-certificates&quot;<br>
+<br>
+FILES_${PN} +=3D &quot;${datadir}/zsh&quot;<br>
+<br>
+inherit multilib_script<br>
+MULTILIB_SCRIPTS =3D &quot;${PN}-dev:${bindir}/curl-config&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
-- <br>
2.7.4<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000009200c105b7141ab9--
