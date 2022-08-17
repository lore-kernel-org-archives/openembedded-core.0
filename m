Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87550C25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 14:25:35 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.29230.1660746326319387974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:25:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gteqvlXd;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.43,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f43.google.com with SMTP id i14so24798353ejg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 07:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=2v6FyRT7jPHqRw7gX9QYx5+RngkxzZmUIMWS41D9D8k=;
        b=gteqvlXdByVN78NYIDxUlgxvSSJ1ZSE944jlhmFPMjiHelVXI4e5BgV/ILq3DLaW75
         e80AQh4Lf4YcwoHC55ftiIp4Y7kb+ID013yCi51klzL8uR9ulPc8H8/QzeZwL+IMqwSL
         Ocr4DSLBVvES4iSfhnCO/sy/TMjcD12e57Dh+gVFblC1/9knOAKYa1WTI7K6/+kmZlvq
         846hczet05HRd8N1GOclXSG1FCHG8vrWi/saF/i93ztxm3/nnBwIu9/A7xL5YdH0s6Ja
         xpRK4g6gcoC5E53DA2lQtmY5TM+MOoyS5JNXq+OKe5I5uz8JGYXIZTaqwAVHlXVnG/Tz
         hROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=2v6FyRT7jPHqRw7gX9QYx5+RngkxzZmUIMWS41D9D8k=;
        b=jsN9zUBOtm7evRn1wAC1yGbTojMSz8/FCeFK0Kzr2h2GNKblGwAwsc+rmwvgMDdIS2
         unC4kSvv0QnDV9kPiuppsm5GhBqDyB9WqsQUOFCu9kgHxT5iBlAM/4tnMNqH7+ktdMw2
         wu4FOx8SzNU65poM11GFeOCzE71sv+xsu8NT8lbeYagTiN8tZ/P18yTa9jdzPmZ2+dGU
         m83GFj3Fto17lIDVZgn1WCxNU9zC9v3IDW0U/yNdlygp1oGr5xXs1TWQ/bN32C5VKdJv
         S5km5mnwA+7yfgGDouB6FBD/o6UevaLgSj9nvvxnLRdv2qczZEayf7Yhn88YgbFxNjmh
         d8TA==
X-Gm-Message-State: ACgBeo3W8EpUiiVxoMAKiPNbk0jbM6Vk219poJDKeZNDSkjJvJh287WD
	cxbZzjKvlUf+3SuULgR2TSprZz9JGmHwHj82gRo8yg==
X-Google-Smtp-Source: 
 AA6agR6CmbdeVbpxFPFA0qblhZJfV5MG7gv5qrVvU1moLDRxAZagTqjYy/ZjM0tjnwzp6tGRZry2t3csmpZ08/FtVbg=
X-Received: by 2002:a17:906:4786:b0:732:fc99:cf68 with SMTP id
 cw6-20020a170906478600b00732fc99cf68mr18200664ejc.18.1660746324478; Wed, 17
 Aug 2022 07:25:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220816135649.2312716-1-muhammad_hamza@mentor.com>
In-Reply-To: <20220816135649.2312716-1-muhammad_hamza@mentor.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 17 Aug 2022 04:25:13 -1000
Message-ID: 
 <CAOSpxdZKRvYDf3bQpCTOVu4aYmqYG_+jTUUmD_eQgSMcA0cOWQ@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][kirkstone][PATCH] libcoap: Add recipe
To: Muhammad Hamza <Muhammad_Hamza@mentor.com>
Cc: openembedded-core@lists.openembedded.org,
	Alex Kiernan <alex.kiernan@gmail.com>, Alex Kiernan <alexk@zuma.ai>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 14:25:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169484

This is a patch for meta-openembedded (not oe-core), so it should be
sent to openembedded-devel@lists.openembedded.org.  Otherwise the
meta-openembedded maintainer may not see it!

Steve

On Tue, Aug 16, 2022 at 3:57 AM Muhammad Hamza
<Muhammad_Hamza@mentor.com> wrote:
>
> From: Alex Kiernan <alex.kiernan@gmail.com>
>
> libcoap implements a lightweight application-protocol for devices that
> are constrained their resources such as computing power, RF range,
> memory, bandwith, or network packet sizes.
>
> Upstream-Status: Bacport from
> https://github.com/openembedded/meta-openembedded/commit/1556da89029c364bea101e782bdd016b69cddb82
>
> Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>  ...alance-SESSIONS_ADD-and-SESSIONS_DEL.patch | 51 ++++++++++++++++
>  ...0001-libcoap-Fix-gnu-configize-error.patch | 44 ++++++++++++++
>  .../libcoap/libcoap/run-ptest                 |  7 +++
>  .../recipes-devtools/libcoap/libcoap_4.3.0.bb | 58 +++++++++++++++++++
>  4 files changed, 160 insertions(+)
>  create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
>  create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
>  create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
>  create mode 100644 meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
>
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
> new file mode 100644
> index 000000000..c8ac8485a
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch
> @@ -0,0 +1,51 @@
> +From c56a64ff4df7eecb6c88ff929497bcd0d65934f2 Mon Sep 17 00:00:00 2001
> +From: Jon Shallow <supjps-libcoap@jpshallow.com>
> +Date: Fri, 22 Apr 2022 13:15:39 +0100
> +Subject: [PATCH] coap_session.c: Balance SESSIONS_ADD and SESSIONS_DELETE
> + usage
> +
> +Upstream-Status: Backport [https://github.com/obgm/libcoap/commit/7e20aa9ef17277f39203334404e6c776b1171a7d]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> +---
> + src/coap_session.c | 12 ++++++++++++
> + 1 file changed, 12 insertions(+)
> +
> +diff --git a/src/coap_session.c b/src/coap_session.c
> +index 77cae598f0af..536e57573361 100644
> +--- a/src/coap_session.c
> ++++ b/src/coap_session.c
> +@@ -813,6 +813,12 @@ coap_session_create_client(
> +   return session;
> +
> + error:
> ++  /*
> ++   * Need to add in the session as coap_session_release()
> ++   * will call SESSIONS_DELETE in coap_session_free().
> ++   */
> ++  if (session)
> ++    SESSIONS_ADD(ctx->sessions, session);
> +   coap_session_release(session);
> +   return NULL;
> + }
> +@@ -1133,11 +1139,17 @@ coap_session_t *coap_new_server_session(
> +   if (session) {
> +     coap_log(LOG_DEBUG, "***%s: new incoming session\n",
> +              coap_session_str(session));
> ++    /* Returned session may already have been released and is now NULL */
> +     session = coap_session_accept(session);
> +   }
> +   return session;
> +
> + error:
> ++  /*
> ++   * Need to add in the session as coap_session_release()
> ++   * will call SESSIONS_DELETE in coap_session_free().
> ++   */
> ++  SESSIONS_ADD(ep->sessions, session);
> +   coap_session_free(session);
> +   return NULL;
> + }
> +--
> +2.35.1
> +
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
> new file mode 100644
> index 000000000..64f8d3acc
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap/0001-libcoap-Fix-gnu-configize-error.patch
> @@ -0,0 +1,44 @@
> +From 25f1bebf1bc4c8da47f976d24a7a424253744e2e Mon Sep 17 00:00:00 2001
> +From: Alex Kiernan <alex.kiernan@gmail.com>
> +Date: Wed, 24 Mar 2021 09:10:17 +0000
> +Subject: [PATCH] libcoap: Fix gnu-configize error
> +
> +Fix:
> +
> +  autoreconf: running: gnu-configize
> +  gnu-configize: 'configure.ac' or 'configure.in' is required
> +  autoreconf: gnu-configize failed with exit status: 1
> +
> +We're not pulling in the ext/tinydtls submodule, so this fails.
> +
> +Upstream-Status: Inappropriate [oe-specific]
> +Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
> +Signed-off-by: Alex Kiernan <alexk@zuma.ai>
> +---
> + configure.ac | 13 -------------
> + 1 file changed, 13 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 9f51f4c67557..559808e03aa2 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -472,19 +472,6 @@ if test "x$build_dtls" = "xyes"; then
> +         have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +     fi
> +
> +-    # The user wants to use explicit TinyDTLS if '--with-tinydtls was set'.
> +-    if test "x$with_tinydtls" = "xyes" ; then
> +-        if test -d "$srcdir/ext/tinydtls"; then
> +-           AC_CONFIG_SUBDIRS([ext/tinydtls])
> +-           have_tinydtls="yes"
> +-         else
> +-           have_tinydtls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-         fi
> +-         have_gnutls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-         have_openssl="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-         have_mbedtls="no" # don't confuse AC_MSG_RESULT at the end of the script
> +-    fi
> +-
> +     if test "$TLSCOUNT" -eq 0; then
> +       # The user hasn't requested the use of a specific cryptography library
> +       # we try first GnuTLS for usability ...
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
> new file mode 100644
> index 000000000..b56ffe68f
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap/run-ptest
> @@ -0,0 +1,7 @@
> +#!/bin/sh
> +
> +if /usr/lib/libcoap/ptest/testdriver; then
> +       echo "PASS: libcoap"
> +else
> +       echo "FAIL: libcoap"
> +fi
> diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
> new file mode 100644
> index 000000000..aba81d126
> --- /dev/null
> +++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.0.bb
> @@ -0,0 +1,58 @@
> +SUMMARY = "A C implementation of the Constrained Application Protocol"
> +DESCRIPTION = "libcoap implements a lightweight application-protocol for \
> +devices that are constrained their resources such as computing power, \
> +RF range, memory, bandwith, or network packet sizes."
> +HOMEPAGE ="https://libcoap.net/"
> +
> +LICENSE = "BSD-2-Clause & BSD-1-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=e44b3af4925ec58e9f49b9ff143b5493"
> +
> +SRC_URI = "git://github.com/obgm/libcoap.git;branch=main;protocol=https \
> +           file://0001-libcoap-Fix-gnu-configize-error.patch \
> +           file://0001-coap_session.c-Balance-SESSIONS_ADD-and-SESSIONS_DEL.patch \
> +           file://run-ptest \
> +           "
> +SRCREV = "1da37b9abbe871675d5939395b498324ccc8ecfe"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools manpages pkgconfig ptest
> +
> +PACKAGECONFIG ?= "\
> +    async openssl tcp \
> +    ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
> +"
> +PACKAGECONFIG[async] = "--enable-async,--disable-async"
> +PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls,,openssl mbedtls"
> +PACKAGECONFIG[manpages] = "--enable-documentation --enable-doxygen --enable-manpages,--disable-documentation,asciidoc-native doxygen-native graphviz-native"
> +PACKAGECONFIG[mbedtls] = "--with-mbedtls,--without-mbedtls,mbedtls,,gnutls openssl"
> +PACKAGECONFIG[openssl] = "--with-openssl,--without-openssl,openssl,,gnutls mbedtls"
> +PACKAGECONFIG[small-stack] = "--enable-small-stack,--disable-small-stack"
> +PACKAGECONFIG[tcp] = "--enable-tcp,--disable-tcp"
> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,cunit"
> +
> +EXTRA_OECONF = "\
> +    --with-epoll --enable-add-default-names \
> +    --without-tinydtls \
> +    ${@bb.utils.contains_any('PACKAGECONFIG', 'gnutls openssl mbedtls', '--enable-dtls', '--disable-dtls', d)} \
> +"
> +
> +python () {
> +    if d.getVar('PTEST_ENABLED') == "1":
> +        d.setVar('DISABLE_STATIC', '')
> +}
> +
> +export SGML_CATALOG_FILES="file://${STAGING_ETCDIR_NATIVE}/xml/catalog"
> +
> +do_install_ptest () {
> +       install -d ${D}${PTEST_PATH}
> +       install -m 0755 ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +       install -m 0755 ${B}/tests/testdriver ${D}${PTEST_PATH}/testdriver
> +}
> +
> +PACKAGE_BEFORE_PN += "\
> +    ${PN}-bin \
> +"
> +
> +FILES:${PN}-bin = "${bindir}"
> +FILES:${PN}-dev += "${datadir}/${BPN}/examples"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169436): https://lists.openembedded.org/g/openembedded-core/message/169436
> Mute This Topic: https://lists.openembedded.org/mt/93059032/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

