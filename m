Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82049EE7FF7
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 13:44:07 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.39075.1694180643260611065
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 06:44:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=B3qioqtC;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2bcde83ce9fso35454831fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 06:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694180641; x=1694785441; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XmTA95pcY9gSQ7YDJa6+y0Q2mvyzfxxVFu4LhrwQc1s=;
        b=B3qioqtCv7K+O6wDweKIP9rXPRyRr88wiBBzzKMeiVDB+GuaR8Y3pJG1QSaYjli7RU
         bHRRyfQ9W38JMfXgBUKvLUwQH4fHzop3HjxWDC3MFHXGV8fklPmB2j51ym4Dqum3goZI
         mcstDruIUT/nX/MFkmcaUSU6s78toHXnNri3nOEPiqRaFlRcjNdQFRtSGDvO+4oBUfR2
         DjD/mf8lCdDNxiXphLYgr0yLsAnUPrEHvOj0c0RI/P4zgVbi828SW9zYwV5s4EDLw143
         kGlTO82nSZKmMTJ8cAB+rdxdAeDtCT//SDN3Xbm8xpIp4U9qHGv6nqoMCUMBIvO2o+wD
         Q7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694180641; x=1694785441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XmTA95pcY9gSQ7YDJa6+y0Q2mvyzfxxVFu4LhrwQc1s=;
        b=EOyhS+2UbheET5xPi1ekVjRdXjtnqhX1DIUFC0KT1oS0Ogsd5E4RQ8JZJ3cFWPZyl5
         i7Ad2nnj1j0E3bSBq0E1bsSn2Tz1toiDgeGpx9yQLktdQDSUCKVrAfD2d7AmYxk35+m2
         e1hstd/GS/xY1ffTwXiekHLsMjdWVW3Hj3X7KJWw0X5T3GL2xBNbZ+oj/LTjszC6c6vR
         7AOlPf9tA1clmNMqge5nqDDernx1d6FH0annVGMZaPxtDrnEtou2OeChXkNISWPhsXpE
         SmyDNfghvMM1v1q+DJh8c2DNiyCyP8wvYjkVVVk6V9eiVlUi5oezRinUe6He4ksNpfi1
         UHng==
X-Gm-Message-State: AOJu0YzYtUkhq87XvJUJOsPZuFggc4KeMagqZBi/7AbrbpsnBubhb0h+
	S8tK8tJdgNolqsNooOp3EaHVvKI65yJbPoIo21M=
X-Google-Smtp-Source: AGHT+IFhjD3i0y5i8s10nzV3iimz4sdt9zi+v2/iNnP0U5kc+bGY7yTxFISkgmmoBnzK6d5blH2BSDQRUFV4Kvc7iLY=
X-Received: by 2002:a2e:888e:0:b0:2bc:baa0:57b8 with SMTP id
 k14-20020a2e888e000000b002bcbaa057b8mr1908365lji.15.1694180641059; Fri, 08
 Sep 2023 06:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230908130407.2676-1-f_l_k@t-online.de>
In-Reply-To: <20230908130407.2676-1-f_l_k@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 8 Sep 2023 15:43:49 +0200
Message-ID: <CANNYZj9iLmrSma2_PSpUijOoR5BMvgw5ueoNgzuwQDjDYbt6qg@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] RFC: import libxmlb and appstream from meta-oe
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 13:44:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187420

Is it super hard to patch epiphany so that libadwaita is optional?

Alex

On Fri, 8 Sept 2023 at 15:05, Markus Volk <f_l_k@t-online.de> wrote:
>
> The upcoming libadwaita update will have a required dependency on appstream,
> so these will be required in oe-core.
>
> In order to be able to use snowball for appstream by default, also libstemmer
> would need to be moved.
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/conf/distro/include/maintainers.inc      |  2 +
>  .../appstream/0001-fix-crosscompile.patch     | 43 +++++++++++++++
>  .../appstream/appstream_0.16.3.bb             | 52 +++++++++++++++++++
>  .../recipes-support/libxmlb/libxmlb/run-ptest |  3 ++
>  .../recipes-support/libxmlb/libxmlb_0.3.14.bb | 24 +++++++++
>  5 files changed, 124 insertions(+)
>  create mode 100644 meta/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
>  create mode 100644 meta/recipes-support/appstream/appstream_0.16.3.bb
>  create mode 100644 meta/recipes-support/libxmlb/libxmlb/run-ptest
>  create mode 100644 meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 3619588ae6..18977fd671 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -40,6 +40,7 @@ RECIPE_MAINTAINER:pn-alsa-ucm-conf = "Michael Opdenacker <michael.opdenacker@boo
>  RECIPE_MAINTAINER:pn-alsa-utils = "Michael Opdenacker <michael.opdenacker@bootlin.com>"
>  RECIPE_MAINTAINER:pn-apr = "Hongxu Jia <hongxu.jia@windriver.com>"
>  RECIPE_MAINTAINER:pn-apr-util = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER:pn-appstream = "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-apt = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-argp-standalone = "Khem Raj <raj.khem@gmail.com>"
>  RECIPE_MAINTAINER:pn-asciidoc = "Yi Zhao <yi.zhao@windriver.com>"
> @@ -447,6 +448,7 @@ RECIPE_MAINTAINER:pn-libxml-sax-base-perl = "Tim Orling <tim.orling@konsulko.com
>  RECIPE_MAINTAINER:pn-libxml-sax-perl = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-libxml-simple-perl = "Tim Orling <tim.orling@konsulko.com>"
>  RECIPE_MAINTAINER:pn-libxml2 = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER:pn-libxmlb = "Markus Volk <f_l_k@t-online.de>"
>  RECIPE_MAINTAINER:pn-libxmu = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libxpm = "Unassigned <unassigned@yoctoproject.org>"
>  RECIPE_MAINTAINER:pn-libxrandr = "Unassigned <unassigned@yoctoproject.org>"
> diff --git a/meta/recipes-support/appstream/appstream/0001-fix-crosscompile.patch b/meta/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> new file mode 100644
> index 0000000000..fe8dcff910
> --- /dev/null
> +++ b/meta/recipes-support/appstream/appstream/0001-fix-crosscompile.patch
> @@ -0,0 +1,43 @@
> +From 6ab00a4279823829a9b82dc9e4d055da4de88c6e Mon Sep 17 00:00:00 2001
> +From: Markus Volk <f_l_k@t-online.de>
> +Date: Mon, 12 Dec 2022 15:42:42 +0100
> +Subject: [PATCH] fix crosscompile
> +
> +Signed-off-by: Markus Volk <f_l_k@t-online.de>
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +---
> + data/meson.build  | 2 +-
> + meson.build       | 2 +-
> + tools/meson.build | 9 +++++++++
> + 3 files changed, 11 insertions(+), 2 deletions(-)
> +
> +diff --git a/data/meson.build b/data/meson.build
> +index aea0cb25..1a085fc9 100644
> +--- a/data/meson.build
> ++++ b/data/meson.build
> +@@ -14,7 +14,7 @@ install_data('its/metainfo.loc',
> + metainfo_with_relinfo = custom_target('gen-output',
> +     input : ['../NEWS', 'org.freedesktop.appstream.cli.metainfo.xml'],
> +     output : ['nol10n_withrelinfo_org.freedesktop.appstream.cli.metainfo.xml'],
> +-    command : [ascli_exe, 'news-to-metainfo', '--limit=6', '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> ++    command : ['appstreamcli', 'news-to-metainfo', '--limit=6', '@INPUT0@', '@INPUT1@', '@OUTPUT@']
> + )
> +
> + metainfo_i18n = i18n.itstool_join(
> +diff --git a/meson.build b/meson.build
> +index fd0e3373..2f273ada 100644
> +--- a/meson.build
> ++++ b/meson.build
> +@@ -124,7 +124,7 @@ if get_option ('gir')
> +     dependency('gobject-introspection-1.0', version: '>=1.56')
> + endif
> +
> +-stemmer_inc_dirs = include_directories(['/usr/include'])
> ++stemmer_inc_dirs = include_directories([''])
> + if get_option('stemming')
> +     stemmer_lib = cc.find_library('stemmer', required: true)
> +     if not cc.has_header('libstemmer.h')
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/appstream/appstream_0.16.3.bb b/meta/recipes-support/appstream/appstream_0.16.3.bb
> new file mode 100644
> index 0000000000..52d23732af
> --- /dev/null
> +++ b/meta/recipes-support/appstream/appstream_0.16.3.bb
> @@ -0,0 +1,52 @@
> +SUMMARY = "AppStream is a collaborative effort for making machine-readable software metadata easily available."
> +HOMEPAGE = "https://github.com/ximion/appstream"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=435ed639f84d4585d93824e7da3d85da"
> +
> +DEPENDS = " \
> +    appstream-native \
> +    curl-native \
> +    curl \
> +    docbook-xml-dtd4-native \
> +    gperf-native \
> +    glib-2.0 \
> +    libyaml \
> +    libxml2 \
> +    libxmlb \
> +    libxslt-native \
> +    itstool-native \
> +    docbook-xsl-stylesheets-native \
> +    python3-pygments-native \
> +"
> +
> +inherit meson gobject-introspection gettext gtk-doc pkgconfig vala
> +
> +GIR_MESON_OPTION = "gir"
> +GTKDOC_MESON_OPTION = "apidocs"
> +
> +SRC_URI = "https://www.freedesktop.org/software/appstream/releases/AppStream-${PV}.tar.xz"
> +SRC_URI:append:class-target = " file://0001-fix-crosscompile.patch"
> +SRC_URI[sha256sum] = "081c917646e94d7221c9e4aae54dacda95a27c607fa93cd8e6344a2b318b98b1"
> +
> +S = "${WORKDIR}/AppStream-${PV}"
> +
> +PACKAGECONFIG ?= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
> +
> +PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
> +PACKAGECONFIG[stemming] = "-Dstemming=true,-Dstemming=false,libstemmer"
> +
> +FILES:${PN} += "${datadir}"
> +
> +EXTRA_OEMESON:class-target += " \
> +       --cross-file=${WORKDIR}/meson-${PN}.cross \
> +       ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=true', '-Dvapi=false', d)} \
> +"
> +
> +do_write_config:append:class-target() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +appstreamcli = '${STAGING_BINDIR_NATIVE}/appstreamcli'
> +EOF
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta/recipes-support/libxmlb/libxmlb/run-ptest b/meta/recipes-support/libxmlb/libxmlb/run-ptest
> new file mode 100644
> index 0000000000..6d0bb95d3a
> --- /dev/null
> +++ b/meta/recipes-support/libxmlb/libxmlb/run-ptest
> @@ -0,0 +1,3 @@
> +#! /bin/sh
> +
> +gnome-desktop-testing-runner libxmlb
> diff --git a/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb b/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
> new file mode 100644
> index 0000000000..90f8844051
> --- /dev/null
> +++ b/meta/recipes-support/libxmlb/libxmlb_0.3.14.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "A library to help create and query binary XML blobs"
> +LICENSE = "LGPL-2.1-only"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1803fa9c2c3ce8cb06b4861d75310742"
> +
> +SRC_URI = "git://github.com/hughsie/libxmlb.git;branch=main;protocol=https \
> +           file://run-ptest \
> +           "
> +SRCREV = "aa577b276adc66564f5777f9a522ca3bf0bfa65e"
> +S = "${WORKDIR}/git"
> +
> +DEPENDS = "glib-2.0 xz zstd"
> +
> +inherit gobject-introspection gtk-doc meson ptest-gnome lib_package pkgconfig
> +
> +PACKAGECONFIG ??= "\
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> +"
> +PACKAGECONFIG[tests] = "-Dtests=true,-Dtests=false"
> +
> +GTKDOC_MESON_OPTION = "gtkdoc"
> +
> +FILES:${PN}-bin += "${libexecdir}"
> +
> +BBCLASSEXTEND = "native"
> --
> 2.41.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187417): https://lists.openembedded.org/g/openembedded-core/message/187417
> Mute This Topic: https://lists.openembedded.org/mt/101235781/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

