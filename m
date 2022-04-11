Return-Path: <armccurdy@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F289C4727C
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:17:59 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web12.25762.1649651121939852083
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 21:25:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k8BFYCSN;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: armccurdy@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id s13so18585774ljd.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Apr 2022 21:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V2dUTCEyKIkN8PiTeAWmdrn9TlT0fYc5G12zNpue4OY=;
        b=k8BFYCSN2+JHxJ2d+NPDObNi8UtK1e1fxWXc4DvDvxOOzv82B82ocbIjkY5MjAuYWX
         vLG/Inse9EbpxEX3J2rVbaBV1TjpW9oTJ9ZYgAsgdLCbQec5irI1pVSoH2VG04vLk7K0
         F/mB9Sc5VI4JDAI1Oq9UmwfCV+Cl8mhkF+EEtx5QQLwEi7QCqIJbqHW8nulL4cH7SmdN
         IPbKEdhJnbCn8JcyB3MtRtBD5RJGNRUuSp6TRHKeyI4pe8/8aM4T2xjz5XiN3ecs1amE
         YfZPCdYQFK0m8S0gow3Xqq5Z00ZTIGHTp0ACoVUoL5UkFKZv+OmEzTMrMPJC0r1dBjsi
         sSZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V2dUTCEyKIkN8PiTeAWmdrn9TlT0fYc5G12zNpue4OY=;
        b=V/bbz4kfpBVs66w07qXc341HA7aEcDAUJE/SGKFHv9Ic8/2eTjV4XgmsX18DsqZuPT
         e2QgpdTZ7yjFTzWZNJ3IywvDPpY2Gd57yLtSW5Y441DOfea8QeXZfw4Xz3EeU8NG5coq
         bf2huYqOEMt808EyUaJVvugvjLNIUXsVsaVsOybaJOYTiCQDrO2fhHboQuSVScaEl2Cn
         3lhm/6haDOLdkrWH1B+SoStQM/NPH+mwvg4SassfCbFkJcSELHJN+MAxmkybhHgqPyrt
         9o2vZf+ZH7cQVHLdUInowC85/1aowuNOXUpTemIVzJyIUrgZiaP7/qL532zYiD5z800u
         W5VA==
X-Gm-Message-State: AOAM531C/UcmPHzBLpT9kg1Wr9iSH2q/b87wXh22SKyuyis2MGH+FVqO
	zgDsvShQELIoJ850S+AG1tkziyqf85rutKI3f4g=
X-Google-Smtp-Source: 
 ABdhPJx/3C0Jbq9ePGs5kqgubfq1j0e0RQdrx7pu1rwwznik/ajdTQHs4Q9PLkPeCZX3qRf5yeqr63APFD1w7FjOdW0=
X-Received: by 2002:a2e:3a02:0:b0:24b:6120:1be4 with SMTP id
 h2-20020a2e3a02000000b0024b61201be4mr3053481lja.451.1649651119764; Sun, 10
 Apr 2022 21:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220410172852.4136-1-f_l_k@t-online.de>
In-Reply-To: <20220410172852.4136-1-f_l_k@t-online.de>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 10 Apr 2022 21:25:03 -0700
Message-ID: 
 <CAJ86T=Vojo4Y1sTzHtDca79WQXuWdE6VS0r=P7wpvHHE3nBrQQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] glib-networking: build with gnutls support
To: Markus Volk <f_l_k@t-online.de>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Apr 2022 17:17:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164212

On Sun, Apr 10, 2022 at 10:29 AM Markus Volk <f_l_k@t-online.de> wrote:
>
> this fixes authentication issues with geary and tls connection
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>  meta/recipes-core/glib-networking/glib-networking_2.72.0.bb | 2 +-
>  meta/recipes-support/gnutls/gnutls_3.7.4.bb                 | 2 +-
>  meta/recipes-support/p11-kit/p11-kit_0.24.1.bb              | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> index d578f17aa5..73827b0a85 100644
> --- a/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> +++ b/meta/recipes-core/glib-networking/glib-networking_2.72.0.bb
> @@ -11,7 +11,7 @@ DEPENDS = "glib-2.0"
>
>  SRC_URI[archive.sha256sum] = "100aaebb369285041de52da422b6b716789d5e4d7549a3a71ba587b932e0823b"
>
> -PACKAGECONFIG ??= "openssl ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
> +PACKAGECONFIG ??= "openssl gnutls ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"

This should either be gnutls or openssl, not both. But aside from
that, gnutls brings (L)GPLv3 issues and therefore should not be
enabled by default.

Are you saying that some glib-networking functionality works when
using gnutls but does not work when using openssl? If so, is it a
known limitation? Or a bug? If a bug, has it been reported upstream?
The commit message should explain those kinds of details.

>  PACKAGECONFIG[gnutls] = "-Dgnutls=enabled,-Dgnutls=disabled,gnutls"
>  PACKAGECONFIG[openssl] = "-Dopenssl=enabled,-Dopenssl=disabled,openssl"
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> index b34eb7f5f0..c2bb1da8be 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> @@ -27,7 +27,7 @@ SRC_URI[sha256sum] = "e6adbebcfbc95867de01060d93c789938cf89cc1d1f6ef9ef661890f62
>
>  inherit autotools texinfo pkgconfig gettext lib_package gtk-doc
>
> -PACKAGECONFIG ??= "libidn  ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
> +PACKAGECONFIG ??= "libidn p11-kit ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)}"
>
>  # You must also have CONFIG_SECCOMP enabled in the kernel for
>  # seccomp to work.
> diff --git a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> index 59cbb67961..32c382489e 100644
> --- a/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> +++ b/meta/recipes-support/p11-kit/p11-kit_0.24.1.bb
> @@ -14,7 +14,7 @@ SRC_URI = "git://github.com/p11-glue/p11-kit;branch=master;protocol=https"
>  SRCREV = "dd0590d4e583f107e3e9fafe9ed754149da335d0"
>  S = "${WORKDIR}/git"
>
> -PACKAGECONFIG ??= ""
> +PACKAGECONFIG ??= "trust-paths"
>  PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false,libxslt-native"
>  PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
>
> @@ -29,4 +29,4 @@ FILES:${PN} += " \
>  # PN contains p11-kit-proxy.so, a symlink to a loadable module
>  INSANE_SKIP:${PN} = "dev-so"
>
> -BBCLASSEXTEND = "nativesdk"
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164204): https://lists.openembedded.org/g/openembedded-core/message/164204
> Mute This Topic: https://lists.openembedded.org/mt/90378285/3619030
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [armccurdy@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

