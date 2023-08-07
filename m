Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F0C5EB64DD
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 08:00:11 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.29556.1691395208227400849
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 01:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=W1T1blxU;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2b9fa64db41so65265121fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 01:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691395206; x=1692000006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=karIhQaJt++9rEPMB3ghqalHEt/zdTo5Y8w3R6zAQ6I=;
        b=W1T1blxUVOn+MkALvXTBhEyzyoz87n/EByi0q7ZvzFR3/vbPKO2ck/BuS+qKfhkaI4
         v+YgY0V+Bdhpio0fU9DQVa4/fFqFUyFJ7cAEHZR5xdW6JY33HlOUK7Z6DPCZcMvPu7kG
         AIypG8HudKSQUtTSBZ+oZ96lB1mK5/q9rihZV9hBQT1gYmd29MkvI1NWltSNA4hnVPxQ
         faKQ6PFkdqEkik8YAnm9AOpGvydPOFff8hUEAkuYJ8jiIQVejalTmNBKzMshOFLqCEsu
         uT5Iad3bSOUqxXIfdGgK1Z81Rm9KBIHRWO7QeFTKeVv+so7qnN7+ztJiIQSB9yuBLcbJ
         noww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691395206; x=1692000006;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=karIhQaJt++9rEPMB3ghqalHEt/zdTo5Y8w3R6zAQ6I=;
        b=T/RsUfzGuR0fpZrkFYN7n6yr/RZGVEhg8Of51zODKbUnuNolXGfBQ/BnFUPg81DTD5
         m5Fff3hLFykY+AtH3H0DEOeQLil/KInOQKaIcD3QdqV8iwIZBYWC8BiuxLoSX98SrEUZ
         rYmh/GMel8os/48AExtAg3WLgp84u48IE/eqIBtb0DSRHaM3VPs9ig5GoveuDoyf1P07
         63B3TiWOSn5M5qIMS0SVgWvjlOam4dgu+ApNPSHfR2+56h0Y25w7IvrILLTlH+c/Ou8y
         Zz2ZGs2UmKS4JgUMC3dbChNLssuiv4mQWpG2/9VmwV/g88L/9xAXSEnZPzmrtPFkSUW+
         opYA==
X-Gm-Message-State: AOJu0YxcVVGUs6V0wzvvUKXsF9+hAcW/DyVNP9T4v+YTaLweij4PA6zG
	AS2NwPCZjocZHI3mEr7n81rX4H46AJq1jVYR/wE=
X-Google-Smtp-Source: AGHT+IFSQH+54lx2Ci3N5XpftN8FhDRZ4gDS6Gsocj7+jYabirzUw31u5q7jM0cH2N2P2HXdeRlsthJ3IIemBKTgryo=
X-Received: by 2002:a2e:8706:0:b0:2b9:35ae:c9ac with SMTP id
 m6-20020a2e8706000000b002b935aec9acmr6327101lji.2.1691395206253; Mon, 07 Aug
 2023 01:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230807054858.28804-1-ppjadhav456@gmail.com>
In-Reply-To: <20230807054858.28804-1-ppjadhav456@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 7 Aug 2023 09:59:54 +0200
Message-ID: <CANNYZj-XkG0wtf264Wk0arf_9zB+Xzob1pRNeFFW4rRAUiz=ow@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] alsa-lib: Add ptest
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com, 
	ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 08:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185586

This is now the third time the patches are sent, without addressing my
questions first or fixing the patches.

Alex

On Mon, 7 Aug 2023 at 07:49, Poonam Jadhav <ppjadhav456@gmail.com> wrote:
>
> From: Poonam Jadhav <Poonam.Jadhav@kpit.com>
>
> Alsa-lib is a user space library that provides audio
> and MIDI functionality apis for simplifying application
> programming and provide higher level functionality
>
> ptest executes below binaries on target:
> 1.config
> 2.control
> 3.client_event_filter
> 4.midi_event
> 5.namehint
>
> Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++
>  .../alsa/alsa-lib_1.2.6.1.bb                  | 22 +++++++++++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 5c6a30635f..1a91880321 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -5,6 +5,7 @@
>  #
>  PTESTS_FAST = "\
>      acl-ptest \
> +    alsa-lib-ptest \
>      apr-ptest \
>      apr-util-ptest \
>      attr-ptest \
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib/run-ptest b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> new file mode 100644
> index 0000000000..8fbf9f140a
> --- /dev/null
> +++ b/meta/recipes-multimedia/alsa/alsa-lib/run-ptest
> @@ -0,0 +1,14 @@
> +#!/bin/sh
> +set -eux
> +
> +for t in config control midi_event client_event_filter client_event_filter
> +do
> +    if "./$t" > "alsa-lib_$t.log" 2>&1
> +    then
> +        echo "PASS: $t"
> +    else
> +        echo "FAIL: $t"
> +        cat "alsa-lib_$t.log"
> +    fi
> +    rm "alsa-lib_$t.log"
> +done
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
> index ca6bedae97..78e9c172f1 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.6.1.bb
> @@ -9,10 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
>                      file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
>                      "
>
> -SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
> +SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
> +           file://run-ptest \
> +          "
>  SRC_URI[sha256sum] = "ad582993d52cdb5fb159a0beab60a6ac57eab0cc1bdf85dc4db6d6197f02333f"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  EXTRA_OECONF += " \
>      ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
> @@ -42,3 +44,19 @@ RREPLACES:alsa-conf = "alsa-conf-base"
>  RCONFLICTS:alsa-conf = "alsa-conf-base"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_compile_append() {
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/config.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o config
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/control.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o control
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/client_event"_filter.c -I "${S}/include" -L "${B}/src/.libs/" -lasound -o client_event_filter
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/namehint.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o namehint
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/midi_event.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o midi_event
> +}
> +
> +do_install_ptest_append() {
> +    install -m 0755 "${B}/config" "${D}${PTEST_PATH}"
> +    install -m 0755 "${B}/control" "${D}${PTEST_PATH}"
> +    install -m 0755 "${B}/client_event_filter" "${D}${PTEST_PATH}"
> +    install -m 0755 "${B}/midi_event" "${D}${PTEST_PATH}"
> +    install -m 0755 "${B}/namehint" "${D}${PTEST_PATH}"
> +}
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185582): https://lists.openembedded.org/g/openembedded-core/message/185582
> Mute This Topic: https://lists.openembedded.org/mt/100594669/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

