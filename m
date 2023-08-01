Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF60C0015E
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 10:33:49 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.9562.1690886021545278618
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 03:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Rq6L5rfW;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso82743741fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 03:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690886020; x=1691490820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6p9uIklaEQ4PJo2a31W4JqAdJSMr1v9P+rRb1hn0d70=;
        b=Rq6L5rfWKoc1IxCRsnVBTwFWbxlT9G+5g1k9sXr8acZNw5te4R5rsux2baaCm8gNke
         XwJD4NtATk189Oukt8CsW+OqTqe/rtultCFIIwlyCoQiV0Pc7wJtuT3GvU2IBAEsrmtR
         8MRt406Y3ropBYQoftmAn0xeF63daOOUfbFm9Jn8/L1HHAbjaqdEC2wM9vBoe6WaR7oe
         HwXyFSj11Xav1YgngbmvNdPtwZ/M/zHWv1QZc2Lm5cnJP3Z5dk2aWt2Dgic8CqYL1Ra0
         SsIkcV3YdDOgYxJa0vfYztSoC4LT7ArbFvpjxcepUXy9zHW8izRrTUXvfWs4VXv5EoPa
         DbBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690886020; x=1691490820;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6p9uIklaEQ4PJo2a31W4JqAdJSMr1v9P+rRb1hn0d70=;
        b=H6sNi+q0B82xTVBKsONYHJQKCsWBjf8k7KDuIptimHAFRBB87DobSMF7UdeLtmp6uY
         Jkfv8xcrpKJ0u9QN5XXQ8oQBg0C7+PnxACDS/Wg0L5j/CADche5gYVq7L3vIK8IWPLOY
         fDI27wLFHfll6+XBxcaMDZk+2hMosbB1TAZpSQjbzfTD6tsHk2Sx+HK+M/bYD6NmyFf3
         ezxsEd5F8r2AcVo9Gb06k83kQRkYcW7dABw1GqgAinn/Ir340/GW+jnORu+SIk6YEycA
         i3LtmMDguPhtiDj3/JPNrFQ9ZOT91okQsR4etYETcDLJBUeAfabGRFrhQNsKewntz0iJ
         9OcA==
X-Gm-Message-State: ABy/qLYvtjZvUQugRjTxCxEOyJopSTmXGxntU2kixnst1lvO5oFThxvj
	6sGV1gh8rOnFNA1IHC4lUrd0dYrkX3Yr8MGac+SEezeS
X-Google-Smtp-Source: APBJJlGdGF/kAkXfZWAedNcYLIrA1N2m0ko/QWPzevBJTW3k3Q+L03MWRf+DgiH97B9axqOUW3xc4crYmX3XlRyJp8Y=
X-Received: by 2002:a2e:80c5:0:b0:2b9:e623:c2d8 with SMTP id
 r5-20020a2e80c5000000b002b9e623c2d8mr1949050ljg.44.1690886019612; Tue, 01 Aug
 2023 03:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230801102534.60770-1-ppjadhav456@gmail.com>
In-Reply-To: <20230801102534.60770-1-ppjadhav456@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 12:33:28 +0200
Message-ID: <CANNYZj_UNgeQ6odbQ1Mmf5kjgQMDkLNQcnR7DDLLYw0se3Fj4A@mail.gmail.com>
Subject: Re: [OE-core][dunfell][PATCH] alsa-lib: Add ptest
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com, 
	ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 10:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185237

What do the tests do, and why they should be run? Are they actually
useful to run when assembling a custom distribution, and would they
help uncover integration issues? If it's merely testing the component
itself, and it is regularly run by upstream, there is little benefit
to adding them to yocto qa.

The tests should be built via upstream makefiles, not via a manually
hardcoded list (which is also incomplete compared to the makefile, and
there's no explanation for that).

Alex

On Tue, 1 Aug 2023 at 12:25, Poonam Jadhav <ppjadhav456@gmail.com> wrote:
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
>  .../alsa/alsa-lib/run-ptest                   | 14 ++++++++++++++
>  .../alsa/alsa-lib_1.2.1.2.bb                  | 19 ++++++++++++++++++-
>  3 files changed, 33 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 3fb7ec2657..b74e18a322 100644
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
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> index 4867c798b9..192e35ba3a 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> @@ -18,11 +18,12 @@ SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
>             file://0005-ucm-Do-not-fail-to-parse-configs-on-cards-with-an-em.patch \
>             file://0001-Fix-alsa-sound-.h-for-external-programs.patch \
>             file://0001-uapi-Move-typedefs-from-uapi-to-sound.patch \
> +           file://run-ptest \
>             "
>  SRC_URI[md5sum] = "82ddd3698469beec147e4f4a67134ea0"
>  SRC_URI[sha256sum] = "958e260e3673f1f6ff6b2d2c0df3fc2e469bea5b2957163ce96ce17f23e87943"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
>
>  EXTRA_OECONF += " \
>      ${@bb.utils.contains('TARGET_FPU', 'soft', '--with-softfloat', '', d)} \
> @@ -52,3 +53,19 @@ RREPLACES_alsa-conf = "alsa-conf-base"
>  RCONFLICTS_alsa-conf = "alsa-conf-base"
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_compile:append() {
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/config.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o config
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/control.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o control
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/client_event"_filter.c -I "${S}/include" -L "${B}/src/.libs/" -lasound -o client_event_filter
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/namehint.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o namehint
> +    ${CC} ${CFLAGS} ${LDFLAGS} "${S}/test/lsb/midi_event.c" -I "${S}/include" -L "${B}/src/.libs/" -lasound -o midi_event
> +}
> +
> +do_install_ptest:append() {
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
> View/Reply Online (#185236): https://lists.openembedded.org/g/openembedded-core/message/185236
> Mute This Topic: https://lists.openembedded.org/mt/100480016/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

