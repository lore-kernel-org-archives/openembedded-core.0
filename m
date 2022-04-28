Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318AFC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 08:12:15 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web12.7446.1651133526605008142
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 01:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pj776rD0;
 spf=pass (domain: gmail.com, ip: 209.85.208.170,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 17so5708443lji.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=c6DF229Fz21ud4XoAoZ9lLRN8hdWStJ/08gs8MjHW5I=;
        b=pj776rD0ZmejKmkdpzKZHQP/l8OZTH4qY1m65v2xhrBnG11E/QiBINe85NdgfXl7/X
         uVkX0ZcBOa4n5pReUOYXZa99irFCOiIwxZ2PMnzQVnUz1jabNAUb4siLvkIpqrsfzYo9
         nKcc9266T95ZnncHpQmZp90UIQn1vt5CuU0A+W8oal34g3foZqv/8NMC0H+eP3dPO2Xk
         LOfR9FnrHwgqkrk/xNzSLDmgRB23oYIl25FEGmDp1RttfvmBjbThxk3McMRY7HvOVP9r
         fD6VNyAQp5tAeoixkz5CM7JkEwbbcJyrQWSyiaxom1Q9a8PrOP3Ej6H8oIa9e9H5LGnR
         /vVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=c6DF229Fz21ud4XoAoZ9lLRN8hdWStJ/08gs8MjHW5I=;
        b=b4DwIlMhg2kgCRoaZGbVDhqXmDNJ4cpxlyw7b3EvmCUVLTIeh9ULk0ZQUi0a9HjIYH
         XR6EQyyjv+xiRDTdpUPmFdDW6rm6fwEmhMNJhVF47NzQa4guphKM9aMZK4INlvNPRo4d
         /r0okFgw1jqR3SjCTfuckQ52IQb+tQvdhKj16m9a1oco1TfSq8ZwDK3v7X6IkNEfXwLl
         uPOdVvUtg5xE60MZx6SRtWzewAYUFi+J+gm0y3oV6CD5J5SaV0VRti5E7cE8/Q71aOqN
         uwJ3Uhg1ztQUdftKUSWSFntDc3//1Q4hLIWKdOmbPcVcFIWQkSGIjxDp0VSnVNn23zJ6
         4ZqQ==
X-Gm-Message-State: AOAM533QyYRvtnvsdSc7ICex4q7t1J7nXFZ3Tr7TsQRtvnldOgN1nIIv
	m3B2R235hYX4Es0Z155kfGp8KrEJv14ssqNo9K4=
X-Google-Smtp-Source: 
 ABdhPJxmXcNyhGzXgRE9u5ULdi9rodRcKBoXSRpPpX4k6GksmR+HBmj0FkbzBJikWvd2Yia4PR5+EDW54n1woFsy98g=
X-Received: by 2002:a2e:9e8d:0:b0:24b:5af4:3feb with SMTP id
 f13-20020a2e9e8d000000b0024b5af43febmr20781762ljk.257.1651133524289; Thu, 28
 Apr 2022 01:12:04 -0700 (PDT)
MIME-Version: 1.0
References: <1651131215-4196-1-git-send-email-leimaohui@fujitsu.com>
In-Reply-To: <1651131215-4196-1-git-send-email-leimaohui@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 28 Apr 2022 10:11:52 +0200
Message-ID: 
 <CANNYZj_5zAZvg_rbPw4C-YNA6ptohpxvDOXbCdNvj3Bom08b3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gnutls: Added fips support option.
To: leimaohui <leimaohui@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 08:12:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164935

What do those do_compile/do_install tweaks do, and why are they
necessary? Please explain, it seems like there might be a better way
to do this.

Alex

On Thu, 28 Apr 2022 at 09:34, leimaohui <leimaohui@fujitsu.com> wrote:
>
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  meta/recipes-support/gnutls/gnutls_3.7.4.bb | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.7.4.bb b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> index b34eb7f..5a34805 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.7.4.bb
> @@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=71391c8e0c1cfe68077e7fce3b586283 \
>                      file://doc/COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
>
>  DEPENDS = "nettle gmp virtual/libiconv libunistring"
> +DEPENDS:append:class-target = " gnutls-native"
>  DEPENDS:append:libc-musl = " argp-standalone"
>
>  SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
> @@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
>  PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
>  PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
>  PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
> +PACKAGECONFIG[fips] = "--enable-fips140-mode,--disable-fips140-mode"
>
>  EXTRA_OECONF = " \
>      --enable-doc \
> @@ -59,6 +61,21 @@ do_configure:prepend() {
>         done
>  }
>
> +do_compile:prepend:class-target () {
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
> +          sed -i -e "s#\$(builddir)/fipshmac#${STAGING_DIR_NATIVE}${libdir}/fipshmac#g" ${B}/lib/Makefile
> +        fi
> +}
> +
> +do_install:append:class-native() {
> +        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
> +          install -d ${D}${libdir}
> +          install -d ${D}${libdir}/.libs
> +          install -m 0755 ${B}/lib/fipshmac ${D}${libdir}/
> +          install -m 0755 ${B}/lib/.libs/fipshmac ${D}${libdir}/.libs/
> +        fi
> +}
> +
>  PACKAGES =+ "${PN}-openssl ${PN}-xx"
>
>  FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
> --
> 1.8.3.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164933): https://lists.openembedded.org/g/openembedded-core/message/164933
> Mute This Topic: https://lists.openembedded.org/mt/90748530/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

