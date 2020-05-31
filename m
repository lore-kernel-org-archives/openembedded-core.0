Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
 by mx.groups.io with SMTP id smtpd.web11.18254.1590942472626626335
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2020 09:27:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pp+b80/P;
 spf=pass (domain: gmail.com, ip: 209.85.217.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f44.google.com with SMTP id 1so4262470vsl.9
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2020 09:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QvM05YmAhWlIovUpj/IxNIlosri15Vbx7UddsRaLPYI=;
        b=pp+b80/PzPnnIDz1RYdqkprMZ/HZxGA9LaxTsph9D0BwNAEOAUmTMSWb2Z49ll+bI+
         F1HQLSIpIDeQuJO09rK9smN1TEQn3A3QjHt4+AcYfOABu7bbAWzS2Ra5FZqoOn+qKnT5
         XZ4yXbuOh3MU0OtiIqnDvUVBIAxKYA6WdkSz5r0DV320pQIhhqhLnjdKs1NL6ObSNDKw
         35XsiYFcSBVlIR4bxxLcLR9BLdlp+FeiFeB46UK6i7M7j9w/XFdMz+0ZK1bCbHaWchLE
         jc0Nk7wVp6FBu1g7srCvzYRPo69MsZbrFgKQcyqqFFRVoLPEdNS5IYPukzKn4v0F9kwq
         digw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QvM05YmAhWlIovUpj/IxNIlosri15Vbx7UddsRaLPYI=;
        b=g3RUmg4TMN08pUIXnKF8Q/bGrRyMYiLASsgO48cpeK0x39uV39P3+6U60/qBSqZ5na
         gaqTS4YI0w2Dr/CHUw3ksxKOBxPVrUswSSe44lFFniprr5ntN/OT/niR+fHiXR8QvD+6
         bL8t2Zzbd7GWPmeuukUv9bxH+2y3sG94nqG3xNJJIZuW7+fzgDbOEjJrpdIn7zZfrFJK
         8FHPucJLwWE7gA4zcOGvxmM52Nyyi5oNvgwA3ka7/PSN0CLy4fdwKlgoMDy4lDMcgjvt
         N4u9soBdDukunn3R+TU8AD2mQfyy4XCGht+5ic4K/CV4hZcWxcYYSMjCRSjU5ktIaxBl
         kjfQ==
X-Gm-Message-State: AOAM531m1X896niGQnL+ylmH14uVdq1qzYmLndnwPLiAfpCXftRuHpho
	yBfvUwRU2TlMzWwtMNVvwy/65yCzINTPE5J+krI=
X-Google-Smtp-Source: ABdhPJw3/r+qXXhrhjdntN2i8k3aVKVs34UDk12JvEsmNfZOaBjvVnUQreRzoA3AFLuueWj5kbkAlEE6UoMryjo7UoE=
X-Received: by 2002:a67:be05:: with SMTP id x5mr10941165vsq.35.1590942471709;
 Sun, 31 May 2020 09:27:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200227205608.26788-1-akuster808@gmail.com> <20200227205608.26788-3-akuster808@gmail.com>
In-Reply-To: <20200227205608.26788-3-akuster808@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sun, 31 May 2020 18:27:38 +0200
Message-ID: <CANNYZj8v71j6_P5wfvf7PQfyX5Fhq3yR+QRD1+ik8ZNhXcRqbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] bind: Update to latest ESV version 9.16
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster@mvista.com>
Content-Type: multipart/alternative; boundary="000000000000e269c205a6f428c6"

--000000000000e269c205a6f428c6
Content-Type: text/plain; charset="UTF-8"

Hello Armin,

can you rebase and resend the bind update please?

Alex

On Thu, 27 Feb 2020 at 21:56, Armin Kuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> Removed obsolete packageconfig options
>
> License change to MPL-2.0
> https://gitlab.isc.org/isc-projects/bind9/blob/master/LICENSE
>
> Refreshed:
> bind-ensure-searching-for-json-headers-searches-sysr.patch
> 0001-named-lwresd-V-and-start-log-hide-build-options.patch
>
> Drop obsolete patch:
> 0001-configure.in-remove-useless-L-use_openssl-lib.patch
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  ....in-remove-useless-L-use_openssl-lib.patch | 30 --------------
>  ...d-V-and-start-log-hide-build-options.patch | 33 +++++++--------
>  ...ching-for-json-headers-searches-sysr.patch | 14 +++----
>  .../bind/{bind_9.11.13.bb => bind_9.16.0.bb}  | 40 +++++++------------
>  4 files changed, 38 insertions(+), 79 deletions(-)
>  delete mode 100644
> meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
>  rename meta/recipes-connectivity/bind/{bind_9.11.13.bb => bind_9.16.0.bb}
> (77%)
>
> diff --git
> a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
> b/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
> deleted file mode 100644
> index 9d31b98080..0000000000
> ---
> a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-L-use_openssl-lib.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 2325a92f1896a2a7f586611686801b41fbc91b50 Mon Sep 17 00:00:00 2001
> -From: Hongxu Jia <hongxu.jia@windriver.com>
> -Date: Mon, 27 Aug 2018 15:00:51 +0800
> -Subject: [PATCH] configure.in: remove useless `-L$use_openssl/lib'
> -
> -Since `--with-openssl=${STAGING_DIR_HOST}${prefix}' is used in bind
> recipe,
> -the `-L$use_openssl/lib' has a hardcoded suffix, removing it is harmless
> -and helpful for clean up host build path in isc-config.sh
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -
> -Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> -
> ----
> - configure.ac | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/configure.ac b/configure.ac
> -index e85a5c6..2bbfc58 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -1631,7 +1631,7 @@ If you don't want OpenSSL, use --without-openssl])
> -                               fi
> -                               ;;
> -                       *)
> --                              DST_OPENSSL_LIBS="-L$use_openssl/lib
> -lcrypto"
> -+                              DST_OPENSSL_LIBS="-lcrypto"
> -                               ;;
> -                       esac
> -               fi
> diff --git
> a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> index 75908aa638..5bcc16c9b2 100644
> ---
> a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> +++
> b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log-hide-build-options.patch
> @@ -12,23 +12,24 @@ $ named -V
>  Upstream-Status: Inappropriate [oe-core specific]
>
>  Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +Refreshed for 9.16.0
> +Signed-off-by: Armin Kuster <akuster@mvista.com>
> +
>  ---
>   bin/named/include/named/globals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/bin/named/include/named/globals.h
> b/bin/named/include/named/globals.h
> -index ba3457e..7741da7 100644
> ---- a/bin/named/include/named/globals.h
> -+++ b/bin/named/include/named/globals.h
> -@@ -68,7 +68,7 @@ EXTERN const char *          ns_g_version
> INIT(VERSION);
> - EXTERN const char *           ns_g_product            INIT(PRODUCT);
> - EXTERN const char *           ns_g_description        INIT(DESCRIPTION);
> - EXTERN const char *           ns_g_srcid              INIT(SRCID);
> --EXTERN const char *           ns_g_configargs         INIT(CONFIGARGS);
> -+EXTERN const char *           ns_g_configargs         INIT("*** (options
> are hidden)");
> - EXTERN const char *           ns_g_builder            INIT(BUILDER);
> - EXTERN in_port_t              ns_g_port               INIT(0);
> - EXTERN isc_dscp_t             ns_g_dscp               INIT(-1);
> ---
> -2.7.4
> -
> +Index: bind-9.16.0/bin/named/include/named/globals.h
> +===================================================================
> +--- bind-9.16.0.orig/bin/named/include/named/globals.h
> ++++ bind-9.16.0/bin/named/include/named/globals.h
> +@@ -69,7 +69,7 @@ EXTERN const char *named_g_version     I
> + EXTERN const char *named_g_product     INIT(PRODUCT);
> + EXTERN const char *named_g_description INIT(DESCRIPTION);
> + EXTERN const char *named_g_srcid       INIT(SRCID);
> +-EXTERN const char *named_g_configargs  INIT(CONFIGARGS);
> ++EXTERN const char *named_g_configargs  INIT("*** (options are hidden)");
> + EXTERN const char *named_g_builder     INIT(BUILDER);
> + EXTERN in_port_t named_g_port        INIT(0);
> + EXTERN isc_dscp_t named_g_dscp               INIT(-1);
> diff --git
> a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> index 84559e5f37..19f1a25ad7 100644
> ---
> a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> +++
> b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-headers-searches-sysr.patch
> @@ -32,16 +32,16 @@ Signed-off-by: Paul Gortmaker <
> paul.gortmaker@windriver.com>
>   configure.ac | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/configure.ac b/configure.ac
> -index 17392fd..e85a5c6 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -2449,7 +2449,7 @@ case "$use_libjson" in
> -               libjson_libs=""
> +Index: bind-9.16.0/configure.ac
> +===================================================================
> +--- bind-9.16.0.orig/configure.ac
> ++++ bind-9.16.0/configure.ac
> +@@ -1214,7 +1214,7 @@ case "$use_lmdb" in
> +               lmdb_libs=""
>                 ;;
>         auto|yes)
>  -              for d in /usr /usr/local /opt/local
>  +              for d in "${STAGING_INCDIR}"
>                 do
> -                       if test -f "${d}/include/json/json.h"
> +                       if test -f "${d}/include/lmdb.h"
>                         then
> diff --git a/meta/recipes-connectivity/bind/bind_9.11.13.bb
> b/meta/recipes-connectivity/bind/bind_9.16.0.bb
> similarity index 77%
> rename from meta/recipes-connectivity/bind/bind_9.11.13.bb
> rename to meta/recipes-connectivity/bind/bind_9.16.0.bb
> index 4e64171cc1..62e9be4c87 100644
> --- a/meta/recipes-connectivity/bind/bind_9.11.13.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.16.0.bb
> @@ -2,12 +2,12 @@ SUMMARY = "ISC Internet Domain Name Server"
>  HOMEPAGE = "http://www.isc.org/sw/bind/"
>  SECTION = "console/network"
>
> -LICENSE = "ISC & BSD"
> -LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=8f17f64e47e83b60cd920a1e4b54419e"
> +LICENSE = "MPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=188b8d0644bd6835df43b84e3f180be1"
>
> -DEPENDS = "openssl libcap zlib"
> +DEPENDS = "openssl libcap zlib libuv"
>
> -SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
> +SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz \
>             file://conf.patch \
>             file://named.service \
>             file://bind9 \
> @@ -15,22 +15,20 @@ SRC_URI = "
> https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>             file://make-etc-initd-bind-stop-work.patch \
>             file://init.d-add-support-for-read-only-rootfs.patch \
>
> file://bind-ensure-searching-for-json-headers-searches-sysr.patch \
> -
>  file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
>
> file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
>
> -SRC_URI[md5sum] = "17de0d024ab1eac377f1c2854dc25057"
> -SRC_URI[sha256sum] =
> "fd3f3cc9fcfcdaa752db35eb24598afa1fdcc2509d3227fc90a8631b7b400f7d"
> +SRC_URI[md5sum] = "f973848bf32797c5f546de7d92a6fd07"
> +SRC_URI[sha256sum] =
> "af4bd9bdaeb1aa7399429972f3a8aa01dd6886b7ae046d703ab8da45330f2e28"
> +SRC_URI[sha1sum] = "01678973598db55dfb03cd12a004d3d75a8ab2bf"
> +SRC_URI[sha384sum] =
> "29df1a4a9d2a460ff970ea3d9abb47ff1204c762fa5c23da0627b0eeb847560f706d333796f61c5aeba09b8333532359"
> +SRC_URI[sha512sum] =
> "6f836fe4cb12d3e2e3a871f69e5b249b2bae6ae1dc542395c79cc974ca95aa595e963b6716a38f6c9d5cb3c54ec606fcd932412a6fbe596651123ac1379dd010"
>
>  UPSTREAM_CHECK_URI = "https://ftp.isc.org/isc/bind9/"
> -# stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by
> 4
> +# stay at 9.16 follow the ESV versions divisible by 4
>  UPSTREAM_CHECK_REGEX = "(?P<pver>9.(11|16|20|24|28)(\.\d+)+(-P\d+)*)/"
>
> -# BIND >= 9.11.2 need dhcpd >= 4.4.0,
> -# don't report it here since dhcpd is already recent enough.
> -CVE_CHECK_WHITELIST += "CVE-2019-6470"
> -
>  inherit autotools update-rc.d systemd useradd pkgconfig multilib_script
> multilib_header
>
>  MULTILIB_SCRIPTS = "${PN}:${bindir}/bind9-config
> ${PN}:${bindir}/isc-config.sh"
> @@ -40,17 +38,14 @@ PACKAGECONFIG ?= "readline"
>  PACKAGECONFIG[httpstats] =
> "--with-libxml2=${STAGING_DIR_HOST}${prefix},--without-libxml2,libxml2"
>  PACKAGECONFIG[readline] = "--with-readline=-lreadline,,readline"
>  PACKAGECONFIG[libedit] = "--with-readline=-ledit,,libedit"
> -PACKAGECONFIG[urandom] =
> "--with-randomdev=/dev/urandom,--with-randomdev=/dev/random,,"
>  PACKAGECONFIG[python3] = "--with-python=yes
> --with-python-install-dir=${PYTHON_SITEPACKAGES_DIR} , --without-python,
> python3-ply-native,"
>
> -ENABLE_IPV6 = "--enable-ipv6=${@bb.utils.contains('DISTRO_FEATURES',
> 'ipv6', 'yes', 'no', d)}"
> -EXTRA_OECONF = " ${ENABLE_IPV6} --with-libtool --enable-threads \
> -                 --disable-devpoll --enable-epoll --with-gost=no \
> -                 --with-gssapi=no --with-ecdsa=yes --with-eddsa=no \
> -                 --with-lmdb=no \
> +EXTRA_OECONF = " --with-libtool --disable-devpoll --enable-epoll \
> +                 --with-gssapi=no --with-lmdb=no --with-zlib \
>                   --sysconfdir=${sysconfdir}/bind \
>                   --with-openssl=${STAGING_DIR_HOST}${prefix} \
>                 "
> +LDFLAGS_append = " -lz"
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'python3', 'python3native
> distutils3-base', '', d)}
>
> @@ -66,13 +61,6 @@ INITSCRIPT_PARAMS = "defaults"
>
>  SYSTEMD_SERVICE_${PN} = "named.service"
>
> -do_install_prepend() {
> -       # clean host path in isc-config.sh before the hardlink created
> -       # by "make install":
> -       #   bind9-config -> isc-config.sh
> -       sed -i -e "s,${STAGING_LIBDIR},${libdir}," ${B}/isc-config.sh
> -}
> -
>  do_install_append() {
>
>         rmdir "${D}${localstatedir}/run"
> @@ -130,7 +118,7 @@ FILES_${PN}-dev += "${bindir}/isc-config.h"
>  FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
>
>  PACKAGE_BEFORE_PN += "${PN}-libs"
> -FILES_${PN}-libs = "${libdir}/*.so*"
> +FILES_${PN}-libs = "${libdir}/*.so* ${libdir}/named/*.so*"
>  FILES_${PN}-staticdev += "${libdir}/*.la"
>
>  PACKAGE_BEFORE_PN += "${@bb.utils.contains('PACKAGECONFIG', 'python3',
> 'python3-bind', '', d)}"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000e269c205a6f428c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello Armin,</div><div><br></div><div>can you rebase =
and resend the bind update please?</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Thu, 27 Feb 2020 at 21:56, Armin Kuster &lt;<a href=3D"mailto:akuster808@=
gmail.com">akuster808@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">From: Armin Kuster &lt;<a href=3D"mailto:a=
kuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;<br>
<br>
Removed obsolete packageconfig options<br>
<br>
License change to MPL-2.0<br>
<a href=3D"https://gitlab.isc.org/isc-projects/bind9/blob/master/LICENSE" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.isc.org/isc-projects/bin=
d9/blob/master/LICENSE</a><br>
<br>
Refreshed:<br>
bind-ensure-searching-for-json-headers-searches-sysr.patch<br>
0001-named-lwresd-V-and-start-log-hide-build-options.patch<br>
<br>
Drop obsolete patch: 0001-configure.in-remove-useless-L-use_openssl-lib.pat=
ch<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targe=
t=3D"_blank">akuster@mvista.com</a>&gt;<br>
---<br>
=C2=A0....in-remove-useless-L-use_openssl-lib.patch | 30 --------------<br>
=C2=A0...d-V-and-start-log-hide-build-options.patch | 33 +++++++--------<br=
>
=C2=A0...ching-for-json-headers-searches-sysr.patch | 14 +++----<br>
=C2=A0.../bind/{<a href=3D"http://bind_9.11.13.bb" rel=3D"noreferrer" targe=
t=3D"_blank">bind_9.11.13.bb</a> =3D&gt; <a href=3D"http://bind_9.16.0.bb" =
rel=3D"noreferrer" target=3D"_blank">bind_9.16.0.bb</a>}=C2=A0 | 40 +++++++=
------------<br>
=C2=A04 files changed, 38 insertions(+), 79 deletions(-)<br>
=C2=A0delete mode 100644 meta/recipes-connectivity/bind/bind/0001-configure=
.in-remove-useless-L-use_openssl-lib.patch<br>
=C2=A0rename meta/recipes-connectivity/bind/{<a href=3D"http://bind_9.11.13=
.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.13.bb</a> =3D&gt; <a hr=
ef=3D"http://bind_9.16.0.bb" rel=3D"noreferrer" target=3D"_blank">bind_9.16=
.0.bb</a>} (77%)<br>
<br>
diff --git a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-u=
seless-L-use_openssl-lib.patch b/meta/recipes-connectivity/bind/bind/0001-c=
onfigure.in-remove-useless-L-use_openssl-lib.patch<br>
deleted file mode 100644<br>
index 9d31b98080..0000000000<br>
--- a/meta/recipes-connectivity/bind/bind/0001-configure.in-remove-useless-=
L-use_openssl-lib.patch<br>
+++ /dev/null<br>
@@ -1,30 +0,0 @@<br>
-From 2325a92f1896a2a7f586611686801b41fbc91b50 Mon Sep 17 00:00:00 2001<br>
-From: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" target=3D=
"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-Date: Mon, 27 Aug 2018 15:00:51 +0800<br>
-Subject: [PATCH] <a href=3D"http://configure.in" rel=3D"noreferrer" target=
=3D"_blank">configure.in</a>: remove useless `-L$use_openssl/lib&#39;<br>
-<br>
-Since `--with-openssl=3D${STAGING_DIR_HOST}${prefix}&#39; is used in bind =
recipe,<br>
-the `-L$use_openssl/lib&#39; has a hardcoded suffix, removing it is harmle=
ss<br>
-and helpful for clean up host build path in isc-config.sh<br>
-<br>
-Upstream-Status: Inappropriate [oe-core specific]<br>
-<br>
-Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" =
target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
-<br>
----<br>
- <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank">conf=
igure.ac</a> | 2 +-<br>
- 1 file changed, 1 insertion(+), 1 deletion(-)<br>
-<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index e85a5c6..2bbfc58 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -1631,7 +1631,7 @@ If you don&#39;t want OpenSSL, use --without-openssl=
])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*)<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DST_OPENSSL_LIBS=3D&quot;-L$use_openssl/lib=
 -lcrypto&quot;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DST_OPENSSL_LIBS=3D&quot;-lcrypto&quot;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0;;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0esac<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
diff --git a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch b/meta/recipes-connectivity/bind/bind/0001=
-named-lwresd-V-and-start-log-hide-build-options.patch<br>
index 75908aa638..5bcc16c9b2 100644<br>
--- a/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch<br>
+++ b/meta/recipes-connectivity/bind/bind/0001-named-lwresd-V-and-start-log=
-hide-build-options.patch<br>
@@ -12,23 +12,24 @@ $ named -V<br>
=C2=A0Upstream-Status: Inappropriate [oe-core specific]<br>
<br>
=C2=A0Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.=
com" target=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
+<br>
+Refreshed for 9.16.0<br>
+Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targ=
et=3D"_blank">akuster@mvista.com</a>&gt;<br>
+<br>
=C2=A0---<br>
=C2=A0 bin/named/include/named/globals.h | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-diff --git a/bin/named/include/named/globals.h b/bin/named/include/named/g=
lobals.h<br>
-index ba3457e..7741da7 100644<br>
---- a/bin/named/include/named/globals.h<br>
-+++ b/bin/named/include/named/globals.h<br>
-@@ -68,7 +68,7 @@ EXTERN const char *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ns=
_g_version=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT(VERSION);<br>
- EXTERN const char *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_product=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT(PRODUCT);<br>
- EXTERN const char *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_descript=
ion=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT(DESCRIPTION);<br>
- EXTERN const char *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_srcid=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT(SRCID);<br>
--EXTERN const char *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_configar=
gs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT(CONFIGARGS);<br>
-+EXTERN const char *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_configar=
gs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT(&quot;*** (options are hidden)&quo=
t;);<br>
- EXTERN const char *=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_builder=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT(BUILDER);<br>
- EXTERN in_port_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ns_g_por=
t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT(0);<br>
- EXTERN isc_dscp_t=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ns_g_dsc=
p=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0INIT(-1);<br>
--- <br>
-2.7.4<br>
-<br>
+Index: bind-9.16.0/bin/named/include/named/globals.h<br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- bind-9.16.0.orig/bin/named/include/named/globals.h<br>
++++ bind-9.16.0/bin/named/include/named/globals.h<br>
+@@ -69,7 +69,7 @@ EXTERN const char *named_g_version=C2=A0 =C2=A0 =C2=A0I<=
br>
+ EXTERN const char *named_g_product=C2=A0 =C2=A0 =C2=A0INIT(PRODUCT);<br>
+ EXTERN const char *named_g_description INIT(DESCRIPTION);<br>
+ EXTERN const char *named_g_srcid=C2=A0 =C2=A0 =C2=A0 =C2=A0INIT(SRCID);<b=
r>
+-EXTERN const char *named_g_configargs=C2=A0 INIT(CONFIGARGS);<br>
++EXTERN const char *named_g_configargs=C2=A0 INIT(&quot;*** (options are h=
idden)&quot;);<br>
+ EXTERN const char *named_g_builder=C2=A0 =C2=A0 =C2=A0INIT(BUILDER);<br>
+ EXTERN in_port_t named_g_port=C2=A0 =C2=A0 =C2=A0 =C2=A0 INIT(0);<br>
+ EXTERN isc_dscp_t named_g_dscp=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0INIT(-1);<br>
diff --git a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-=
json-headers-searches-sysr.patch b/meta/recipes-connectivity/bind/bind/bind=
-ensure-searching-for-json-headers-searches-sysr.patch<br>
index 84559e5f37..19f1a25ad7 100644<br>
--- a/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch<br>
+++ b/meta/recipes-connectivity/bind/bind/bind-ensure-searching-for-json-he=
aders-searches-sysr.patch<br>
@@ -32,16 +32,16 @@ Signed-off-by: Paul Gortmaker &lt;<a href=3D"mailto:pau=
l.gortmaker@windriver.com" target=3D"_blank">paul.gortmaker@windriver.com</=
a>&gt;<br>
=C2=A0 <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a> | 2 +-<br>
=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
-diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"=
_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D"noreferre=
r" target=3D"_blank">configure.ac</a><br>
-index 17392fd..e85a5c6 100644<br>
---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_blank"=
>configure.ac</a><br>
-@@ -2449,7 +2449,7 @@ case &quot;$use_libjson&quot; in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0libjson_libs=3D&quo=
t;&quot;<br>
+Index: bind-9.16.0/<a href=3D"http://configure.ac" rel=3D"noreferrer" targ=
et=3D"_blank">configure.ac</a><br>
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
+--- bind-9.16.0.orig/<a href=3D"http://configure.ac" rel=3D"noreferrer" ta=
rget=3D"_blank">configure.ac</a><br>
++++ bind-9.16.0/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
+@@ -1214,7 +1214,7 @@ case &quot;$use_lmdb&quot; in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lmdb_libs=3D&quot;&=
quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 auto|yes)<br>
=C2=A0-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in /usr /usr/=
local /opt/local<br>
=C2=A0+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for d in &quot;${ST=
AGING_INCDIR}&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if test -f &quot;${d}/include/json/json.h&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0if test -f &quot;${d}/include/lmdb.h&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 then<br>
diff --git a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.11.13.=
bb" rel=3D"noreferrer" target=3D"_blank">bind_9.11.13.bb</a> b/meta/recipes=
-connectivity/bind/<a href=3D"http://bind_9.16.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">bind_9.16.0.bb</a><br>
similarity index 77%<br>
rename from meta/recipes-connectivity/bind/<a href=3D"http://bind_9.11.13.b=
b" rel=3D"noreferrer" target=3D"_blank">bind_9.11.13.bb</a><br>
rename to meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.0.bb" =
rel=3D"noreferrer" target=3D"_blank">bind_9.16.0.bb</a><br>
index 4e64171cc1..62e9be4c87 100644<br>
--- a/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.11.13.bb" rel=
=3D"noreferrer" target=3D"_blank">bind_9.11.13.bb</a><br>
+++ b/meta/recipes-connectivity/bind/<a href=3D"http://bind_9.16.0.bb" rel=
=3D"noreferrer" target=3D"_blank">bind_9.16.0.bb</a><br>
@@ -2,12 +2,12 @@ SUMMARY =3D &quot;ISC Internet Domain Name Server&quot;<b=
r>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"http://www.isc.org/sw/bind/" rel=3D"nor=
eferrer" target=3D"_blank">http://www.isc.org/sw/bind/</a>&quot;<br>
=C2=A0SECTION =3D &quot;console/network&quot;<br>
<br>
-LICENSE =3D &quot;ISC &amp; BSD&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D8f17f64e47e83b60cd920a1e=
4b54419e&quot;<br>
+LICENSE =3D &quot;MPL-2.0&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3D188b8d0644bd6835df43b84e=
3f180be1&quot;<br>
<br>
-DEPENDS =3D &quot;openssl libcap zlib&quot;<br>
+DEPENDS =3D &quot;openssl libcap zlib libuv&quot;<br>
<br>
-SRC_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bind9/$%7BPV%7D/$%7BB=
PN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">https://ftp.is=
c.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz</a> \<br>
+SRC_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bind9/$%7BPV%7D/$%7BB=
PN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://ftp.is=
c.org/isc/bind9/${PV}/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://conf.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://named.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://bind9 \<br>
@@ -15,22 +15,20 @@ SRC_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bi=
nd9/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_bl=
ank">https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://make-etc-initd-bind-stop-w=
ork.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://init.d-add-support-for-rea=
d-only-rootfs.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://bind-ensure-searching-for-=
json-headers-searches-sysr.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-configure.in-remove-u=
seless-L-use_openssl-lib.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-named-lwresd-V-and-st=
art-log-hide-build-options.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-avoid-start-failure-w=
ith-bind-user.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;17de0d024ab1eac377f1c2854dc25057&quot;<br>
-SRC_URI[sha256sum] =3D &quot;fd3f3cc9fcfcdaa752db35eb24598afa1fdcc2509d322=
7fc90a8631b7b400f7d&quot;<br>
+SRC_URI[md5sum] =3D &quot;f973848bf32797c5f546de7d92a6fd07&quot;<br>
+SRC_URI[sha256sum] =3D &quot;af4bd9bdaeb1aa7399429972f3a8aa01dd6886b7ae046=
d703ab8da45330f2e28&quot;<br>
+SRC_URI[sha1sum] =3D &quot;01678973598db55dfb03cd12a004d3d75a8ab2bf&quot;<=
br>
+SRC_URI[sha384sum] =3D &quot;29df1a4a9d2a460ff970ea3d9abb47ff1204c762fa5c2=
3da0627b0eeb847560f706d333796f61c5aeba09b8333532359&quot;<br>
+SRC_URI[sha512sum] =3D &quot;6f836fe4cb12d3e2e3a871f69e5b249b2bae6ae1dc542=
395c79cc974ca95aa595e963b6716a38f6c9d5cb3c54ec606fcd932412a6fbe596651123ac1=
379dd010&quot;<br>
<br>
=C2=A0UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://ftp.isc.org/isc/bind9=
/" rel=3D"noreferrer" target=3D"_blank">https://ftp.isc.org/isc/bind9/</a>&=
quot;<br>
-# stay at 9.11 until 9.16, from 9.16 follow the ESV versions divisible by =
4<br>
+# stay at 9.16 follow the ESV versions divisible by 4<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;(?P&lt;pver&gt;9.(11|16|20|24|28)(\.\d=
+)+(-P\d+)*)/&quot;<br>
<br>
-# BIND &gt;=3D 9.11.2 need dhcpd &gt;=3D 4.4.0,<br>
-# don&#39;t report it here since dhcpd is already recent enough.<br>
-CVE_CHECK_WHITELIST +=3D &quot;CVE-2019-6470&quot;<br>
-<br>
=C2=A0inherit autotools update-rc.d systemd useradd pkgconfig multilib_scri=
pt multilib_header<br>
<br>
=C2=A0MULTILIB_SCRIPTS =3D &quot;${PN}:${bindir}/bind9-config ${PN}:${bindi=
r}/isc-config.sh&quot;<br>
@@ -40,17 +38,14 @@ PACKAGECONFIG ?=3D &quot;readline&quot;<br>
=C2=A0PACKAGECONFIG[httpstats] =3D &quot;--with-libxml2=3D${STAGING_DIR_HOS=
T}${prefix},--without-libxml2,libxml2&quot;<br>
=C2=A0PACKAGECONFIG[readline] =3D &quot;--with-readline=3D-lreadline,,readl=
ine&quot;<br>
=C2=A0PACKAGECONFIG[libedit] =3D &quot;--with-readline=3D-ledit,,libedit&qu=
ot;<br>
-PACKAGECONFIG[urandom] =3D &quot;--with-randomdev=3D/dev/urandom,--with-ra=
ndomdev=3D/dev/random,,&quot;<br>
=C2=A0PACKAGECONFIG[python3] =3D &quot;--with-python=3Dyes --with-python-in=
stall-dir=3D${PYTHON_SITEPACKAGES_DIR} , --without-python, python3-ply-nati=
ve,&quot;<br>
<br>
-ENABLE_IPV6 =3D &quot;--enable-ipv6=3D${@bb.utils.contains(&#39;DISTRO_FEA=
TURES&#39;, &#39;ipv6&#39;, &#39;yes&#39;, &#39;no&#39;, d)}&quot;<br>
-EXTRA_OECONF =3D &quot; ${ENABLE_IPV6} --with-libtool --enable-threads \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-de=
vpoll --enable-epoll --with-gost=3Dno \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-gssap=
i=3Dno --with-ecdsa=3Dyes --with-eddsa=3Dno \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-lmdb=
=3Dno \<br>
+EXTRA_OECONF =3D &quot; --with-libtool --disable-devpoll --enable-epoll \<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--with-gssap=
i=3Dno --with-lmdb=3Dno --with-zlib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --sysconfdir=
=3D${sysconfdir}/bind \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --with-opens=
sl=3D${STAGING_DIR_HOST}${prefix} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+LDFLAGS_append =3D &quot; -lz&quot;<br>
<br>
=C2=A0inherit ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;python3&#3=
9;, &#39;python3native distutils3-base&#39;, &#39;&#39;, d)}<br>
<br>
@@ -66,13 +61,6 @@ INITSCRIPT_PARAMS =3D &quot;defaults&quot;<br>
<br>
=C2=A0SYSTEMD_SERVICE_${PN} =3D &quot;named.service&quot;<br>
<br>
-do_install_prepend() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# clean host path in isc-config.sh before the h=
ardlink created<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0# by &quot;make install&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0#=C2=A0 =C2=A0bind9-config -&gt; isc-config.sh<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i -e &quot;s,${STAGING_LIBDIR},${libdir},&=
quot; ${B}/isc-config.sh<br>
-}<br>
-<br>
=C2=A0do_install_append() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rmdir &quot;${D}${localstatedir}/run&quot;<br>
@@ -130,7 +118,7 @@ FILES_${PN}-dev +=3D &quot;${bindir}/isc-config.h&quot;=
<br>
=C2=A0FILES_${PN} +=3D &quot;${sbindir}/generate-rndc-key.sh&quot;<br>
<br>
=C2=A0PACKAGE_BEFORE_PN +=3D &quot;${PN}-libs&quot;<br>
-FILES_${PN}-libs =3D &quot;${libdir}/*.so*&quot;<br>
+FILES_${PN}-libs =3D &quot;${libdir}/*.so* ${libdir}/named/*.so*&quot;<br>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${libdir}/*.la&quot;<br>
<br>
=C2=A0PACKAGE_BEFORE_PN +=3D &quot;${@bb.utils.contains(&#39;PACKAGECONFIG&=
#39;, &#39;python3&#39;, &#39;python3-bind&#39;, &#39;&#39;, d)}&quot;<br>
-- <br>
2.17.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000e269c205a6f428c6--
