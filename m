Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEFA7EB64DC
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 10:16:14 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.5006.1688033767170610858
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 03:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=fYsqDz49;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3fa96fd7a01so5431825e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688033765; x=1690625765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjoRlOtRhXWxgXuKgL4XW3BahJUp25FAUbMemenEi2A=;
        b=fYsqDz49B3dn8SbMXjbB8GAxNsgXhKKW3hG09XRwIFxWU33R1c2ezv+7uoHO4mDNQp
         v7eqRkF6SPKPogu3wRW+b81a4H5QAfERfPPl/rf8B+OAPJcoj36IgAzqtI9RL+Bd1IPk
         jss00xNYTZH/OAhazRqku+7hqPEX2s/xcJxvc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688033765; x=1690625765;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjoRlOtRhXWxgXuKgL4XW3BahJUp25FAUbMemenEi2A=;
        b=NI0E8ijcHT6zDE0PwGpR/+N0lIJ/OlI+Xmo2kv3IIiQNq6i9uRWeWHgCfRLhFUq/X+
         CQ5jCoN123lpDiFvdWt0omsApzdHR9CysLD441LLb1Xs2K3YUw/LJcewFOsGcWffthEd
         4nsADLPQhmDCy9J0a0glW1MhBkJbE7wZ/JHhR9LprJGM/1too2C/saPPOJ9ELTz5mJIZ
         IUpL9T8AmjWsgpFI+q+FzYU02Ok3q0N0keXWDRWknuaYkFr1TyNSoQ/Px1k93AGoLmIt
         hs5LrYFItfIIHfDLVxCIQv9TmOC/1ZTZv6iU7VQnjYIHRG9yuilrRFLpjzHuvnt5eZcx
         GMxg==
X-Gm-Message-State: AC+VfDykAT/+GW1f787TVW3BkrBEGNLX6iElleKjNDc/fxAJ2ubpbiWY
	w8OS8DLangqG47nYcTH1hmwgrg==
X-Google-Smtp-Source: ACHHUZ5Ws54zkRPFWcm86aow+sN3qx3ub1H1ENZGgm8yiyzmD3/mgM1iwTWDKWVlqbeQ532ODR97Aw==
X-Received: by 2002:a7b:c41a:0:b0:3fb:b1a9:5874 with SMTP id k26-20020a7bc41a000000b003fbb1a95874mr3565468wmi.27.1688033765379;
        Thu, 29 Jun 2023 03:16:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id n9-20020a1c7209000000b003fbacc853ccsm4831169wmc.18.2023.06.29.03.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 03:16:04 -0700 (PDT)
Message-ID: <bae9ee0a8cf98063e0c268e8656c1463458ca2da.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V4] kbd: Add ptest support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "qiutt@fujitsu.com" <qiutt@fujitsu.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Jun 2023 11:16:04 +0100
In-Reply-To: <1685601998-1446-1-git-send-email-qiutt@fujitsu.com>
References: <1685601998-1446-1-git-send-email-qiutt@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 10:16:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183618

On Thu, 2023-06-01 at 14:46 +0800, qiutt@fujitsu.com wrote:
> From: Qiu Tingting <qiutt@fujitsu.com>
>=20
> Add a ptest for kbd
> - It is taking around 1s to execute with kvm, so added it to PTESTS_FAST
> - It contains libkeymap unit tests(27 cases) and libkbdfile unit tests(13=
 cases)
>=20
> Signed-off-by: Qiu Tingting <qiutt@fujitsu.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  meta/recipes-core/kbd/files/run-ptest         | 11 +++
>  meta/recipes-core/kbd/kbd_2.5.1.bb            | 74 ++++++++++++++++++-
>  3 files changed, 85 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-core/kbd/files/run-ptest
>=20
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/=
distro/include/ptest-packagelists.inc
> index da9153b998..7d5883604c 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -27,6 +27,7 @@ PTESTS_FAST =3D "\
>      gzip \
>      json-c \
>      json-glib \
> +    kbd \
>      libconvert-asn1-perl \
>      liberror-perl \
>      libgpg-error\
> diff --git a/meta/recipes-core/kbd/files/run-ptest b/meta/recipes-core/kb=
d/files/run-ptest
> new file mode 100644
> index 0000000000..3b154c4d73
> --- /dev/null
> +++ b/meta/recipes-core/kbd/files/run-ptest
> @@ -0,0 +1,11 @@
> +#!/bin/sh
> +
> +# Define test work dir
> +WORKDIR=3D@PTEST_PATH@/tests/
> +
> +# Run test
> +cd ${WORKDIR}
> +
> +./testsuite -k unittest | sed -e '/[0-9]:/s/://' \
> +    -e '/ ok/s/^/PASS: /;/ FAILED/s/^/FAIL: /;/ skipped/s/^/SKIP: /' \
> +    -e '/ ok/s/ ok.*//;/ skipped/s/ skipped.*//;/ FAILED/s/ FAILED.*//'
> diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd/k=
bd_2.5.1.bb
> index 7662b8f685..283617aaaa 100644
> --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> @@ -5,7 +5,7 @@ DESCRIPTION =3D "The kbd project contains tools for manag=
ing Linux console (Linux
>  LICENSE =3D "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> =20
> -inherit autotools gettext pkgconfig
> +inherit autotools gettext pkgconfig ptest
> =20
>  DEPENDS +=3D "flex-native"
> =20
> @@ -14,6 +14,7 @@ RPROVIDES:${PN} =3D "console-tools"
>  RCONFLICTS:${PN} =3D "console-tools"
> =20
>  SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/${BP}.tar.xz \
> +           file://run-ptest \
>             "
> =20
>  SRC_URI[sha256sum] =3D "ccdf452387a6380973d2927363e9cbb939fa2068915a6f93=
7ff9d24522024683"
> @@ -45,3 +46,74 @@ ALTERNATIVE:${PN} =3D "chvt deallocvt fgconsole openvt=
 showkey \
>  ALTERNATIVE_PRIORITY =3D "100"
> =20
>  BBCLASSEXTEND =3D "native"
> +
> +do_compile_ptest() {
> +    # update DATADIR in Makefile
> +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,=
g' ${B}/tests/libkeymap/Makefile
> +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,=
g' ${B}/tests/helpers/Makefile
> +    sed -i 's,-DDATADIR=3D.*,-DDATADIR=3D\\\"${PTEST_PATH}/tests\\\" \\,=
g' ${B}/tests/libkbdfile/Makefile
> +
> +    # unset -D_TIME_BITS=3D64 in Makefile
> +    sed -i 's,-D_TIME_BITS=3D64,,g' ${B}/tests/libtswrap/Makefile
> +
> +    # recompile tests
> +    oe_runmake -C ${B}/tests/ clean
> +    oe_runmake -C ${B}/tests/
> +}
> +
> +do_install_ptest() {
> +    # install files from build directory
> +    install -d ${D}${PTEST_PATH}/tests/
> +    install --mode=3D755 ${B}/tests/atconfig ${D}${PTEST_PATH}/tests/
> +    install --mode=3D755 ${B}/tests/testsuite ${D}${PTEST_PATH}/tests/
> +    install -d ${D}${PTEST_PATH}/tests/libkeymap/
> +    find ${B}/tests/libkeymap/ -type f -not -name "*.o" -not -name "Make=
file" \
> +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/libkeymap/=
 \;
> +    install -d ${D}${PTEST_PATH}/tests/helpers/
> +    find ${B}/tests/helpers/ -type f -not -name "*.o" -not -name "Makefi=
le" \
> +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/helpers/ \=
;
> +    install -d ${D}${PTEST_PATH}/tests/libkbdfile/
> +    find ${B}/tests/libkbdfile/ -type f -not -name "*.o" -not -name "Mak=
efile" \
> +        -exec install --mode=3D755 {} ${D}${PTEST_PATH}/tests/libkbdfile=
/ \;
> +    install -d ${D}${PTEST_PATH}/src/
> +    install --mode=3D755 ${B}/src/loadkeys ${D}${PTEST_PATH}/src/
> +
> +    # install files from src/data directory
> +    install -d ${D}${PTEST_PATH}/data/keymaps/i386/qwerty/
> +    install ${S}/data/keymaps/i386/qwerty/defkeymap.map ${D}${PTEST_PATH=
}/data/keymaps/i386/qwerty/
> +
> +    # install files from src/tests/data directory
> +    install -d ${D}${PTEST_PATH}/tests/data/
> +    install -d ${D}${PTEST_PATH}/tests/data/libkeymap/
> +    install ${S}/tests/data/libkeymap/* ${D}${PTEST_PATH}/tests/data/lib=
keymap/
> +    install -d ${D}${PTEST_PATH}/tests/data/alt-is-meta/
> +    install ${S}/tests/data/alt-is-meta/* ${D}${PTEST_PATH}/tests/data/a=
lt-is-meta/
> +    install -d ${D}${PTEST_PATH}/tests/data/bkeymap-2.0.4/
> +    install ${S}/tests/data/bkeymap-2.0.4/* ${D}${PTEST_PATH}/tests/data=
/bkeymap-2.0.4/
> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-mktable/
> +    install ${S}/tests/data/dumpkeys-mktable/* ${D}${PTEST_PATH}/tests/d=
ata/dumpkeys-mktable/
> +    install -d ${D}${PTEST_PATH}/tests/data/dumpkeys-fulltable/
> +    install ${S}/tests/data/dumpkeys-fulltable/* ${D}${PTEST_PATH}/tests=
/data/dumpkeys-fulltable/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_1/consolefonts=
/
> +    install ${S}/tests/data/findfile/test_1/consolefonts/* ${D}${PTEST_P=
ATH}/tests/data/findfile/test_1/consolefonts/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/incl=
ude/
> +    install ${S}/tests/data/findfile/test_0/keymaps/test0.map ${D}${PTES=
T_PATH}/tests/data/findfile/test_0/keymaps/
> +    install ${S}/tests/data/findfile/test_0/keymaps/include/* ${D}${PTES=
T_PATH}/tests/data/findfile/test_0/keymaps/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386=
/include/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/include/* ${D}$=
{PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386=
/qwerty/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwerty/* ${D}${=
PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwerty/
> +    install -d ${D}${PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386=
/qwertz/
> +    install ${S}/tests/data/findfile/test_0/keymaps/i386/qwertz/* ${D}${=
PTEST_PATH}/tests/data/findfile/test_0/keymaps/i386/qwertz/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/qwerty/
> +    install ${S}/tests/data/keymaps/i386/qwerty/* ${D}${PTEST_PATH}/test=
s/data/keymaps/i386/qwerty/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/i386/include/
> +    install ${S}/tests/data/keymaps/i386/include/* ${D}${PTEST_PATH}/tes=
ts/data/keymaps/i386/include/
> +    install -d ${D}${PTEST_PATH}/tests/data/keymaps/include/
> +    install ${S}/tests/data/keymaps/include/* ${D}${PTEST_PATH}/tests/da=
ta/keymaps/include/

I'm a bit worried about the relatively large list of files we have here
which looks like it will be sensitive to version upgrades and the test
data changing.

Could we copy in files and then set ownership with some kind of
wildcard instead to simplify this?

Cheers,

Richard


