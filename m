Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBC3C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 07:10:23 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.24473.1653289817323721938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 00:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CHmaqOCr;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id u23so23982073lfc.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 00:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iXJgzSfGZOnPGYiWJJLju1nHuDhkEMLJ6mYDB/us7mk=;
        b=CHmaqOCrFbcb3q8lmXLtPKrX93//u4cGOEenCVUnu9PdLJjwQOy+aiYMTrjUG1Cn8Y
         bfjxdeeMWsw4Wvgqb0cQ5DyJe+y9e7S/WcNmI0h61YTQDKsEnAmw3knXJkpbuPvPFbXu
         B//ztIt5N/Y86lxPiTusyMM0nSynvM6mGh43T0hvhJR4XSWPmf+jsSxnt8WLxS/anOfT
         F0DINhxT3NrMVGoPQz7PzVH313McKDI52YaJX4+qAu+iiQekH5mRjWo1wD3jJsd0+H8a
         Ncp+Fum5FS7yAb8ZMp0ndi0MxD/eTzizmLXenCxGr4NM3fvnKJkEYd6tdULHaepwaM7g
         n+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iXJgzSfGZOnPGYiWJJLju1nHuDhkEMLJ6mYDB/us7mk=;
        b=qWifucb+rAJI7IOBCD3Lwje5kfPZgPdTUMfSJ1BH/WChsAkzEqqm2IX2ufjVgpmD8U
         NlIjIOFXXzfeV2QvJeJiEOad4A5ygjwwOhDfYzTtzIzKEuCiJCmdUPFN1C+A/TieAphF
         1eh9c/ly+d9qcPFOayjafRyqvhgu+E6P+XhOFE2YrkH5TG23uKX+Td+WMQCN3l5xGu+W
         rWo++eCZo+KcOXMkstZdnEQAy/LZ2cbUtvph9Hr5f3OAKwpUe7Zr/DoaUzaxvLwTweMZ
         xinJ+25dd2oWDl9ptaQwjsetfwM0sWNas8hC5/TQfuxgDAPWt+muvjEBCo33BYE48RfI
         +yEg==
X-Gm-Message-State: AOAM530clf41DEg1JTlUSP1jvOxbQ9mRwChHOP60yUNo2Zz7UtumWXtY
	VcJ+FC9fOFrdaFuw6xEAv3UwSCSKH1jKyNJttIE=
X-Google-Smtp-Source: 
 ABdhPJyAAG9xdlZSgg91GzO4X2dkqMLg1WMVK4AbUW5jfibvJcE7l0fuP2UxMB2hNQSX+uDfYMPx0vC2N3az3ygkKZU=
X-Received: by 2002:a05:6512:407:b0:477:b6c6:caff with SMTP id
 u7-20020a056512040700b00477b6c6caffmr14896265lfk.665.1653289815460; Mon, 23
 May 2022 00:10:15 -0700 (PDT)
MIME-Version: 1.0
References: <1653288813-3748-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1653288813-3748-1-git-send-email-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 23 May 2022 09:10:04 +0200
Message-ID: 
 <CANNYZj_f-wQqQ=mXHFwY57qjvvo6JXE73X2gyk7v-GjQAkHuTg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gnutls: Added fips option.
To: leimaohui <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 May 2022 07:10:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165998

Has the issue been raised with upstream? Would be good to include a
link to that into the patch: any new 'inappropriate' patch is a
support burden.

Alex

On Mon, 23 May 2022 at 08:53, leimaohui <leimaohui@fujitsu.com> wrote:
>
> - Added a patch to avoid excute fipshmac command. Because *.hmac
> file should be created on target instead of on build environment.
> - Added pkg_postinst_ontarget to make sure necessary files are
> created on target.
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  ...ile-should-be-excuted-in-target-envi.patch | 28 +++++++++++++++++++
>  meta/recipes-support/gnutls/gnutls_3.7.5.bb   | 24 +++++++++++++++-
>  2 files changed, 51 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
>
> diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
> new file mode 100644
> index 0000000000..7a0e2fd474
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
> @@ -0,0 +1,28 @@
> +From b729a356538d499fe25e82bfc78ea663bdaca0a8 Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Mon, 23 May 2022 10:44:43 +0900
> +Subject: [PATCH] Creating .hmac file should be excuted in target environment,
> + so deleted it from build process.
> +
> +Upstream-Status: Inappropriate [Embedded]
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + lib/Makefile.am | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/Makefile.am b/lib/Makefile.am
> +index 0b43ef9..cf263f0 100644
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -206,8 +206,7 @@ hmac_files = .libs/.gnutls.hmac
> +
> + all-local: $(hmac_files)
> +
> +-.libs/.gnutls.hmac: libgnutls.la fipshmac
> +-      $(AM_V_GEN) $(builddir)/fipshmac > $@-t && mv $@-t $@
> ++.libs/.gnutls.hmac:
> +
> + CLEANFILES = $(hmac_files)
> + endif
> +--
> +2.25.1
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.5.bb b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> index 5feedb7fdc..b796494b8d 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
> @@ -21,6 +21,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
>
>  SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
>             file://arm_eabi.patch \
> +           file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
>             "
>
>  SRC_URI[sha256sum] = "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
> @@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> +PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR}"
>
>  EXTRA_OECONF = " \
>      --enable-doc \
> @@ -59,10 +61,30 @@ do_configure:prepend() {
>         done
>  }
>
> -PACKAGES =+ "${PN}-openssl ${PN}-xx"
> +do_install:append:class-target() {
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
> +          install -d ${D}${bindir}/bin
> +          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
> +        fi
> +}
> +
> +PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
>
>  FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
>  FILES:${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
>  FILES:${PN}-xx = "${libdir}/libgnutlsxx.so.*"
> +FILES:${PN}-fips = "${bindir}/fipshmac"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +pkg_postinst_ontarget:${PN}-fips () {
> +    if test -x ${bindir}/fipshmac
> +    then
> +        mkdir ${sysconfdir}/gnutls
> +        touch ${sysconfdir}/gnutls/config
> +        ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
> +        ${bindir}/fipshmac ${libdir}/libnettle.so.8.* > ${libdir}/.libnettle.so.8.hmac
> +        ${bindir}/fipshmac ${libdir}/libgmp.so.10.*.* > ${libdir}/.libgmp.so.10.hmac
> +        ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libhogweed.so.6.hmac
> +    fi
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165996): https://lists.openembedded.org/g/openembedded-core/message/165996
> Mute This Topic: https://lists.openembedded.org/mt/91283368/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

