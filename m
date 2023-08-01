Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D7FC001DF
	for <webhook@archiver.kernel.org>; Tue,  1 Aug 2023 13:42:40 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.13152.1690897358121339646
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Aug 2023 06:42:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=aB3z7Vte;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2b9db1de50cso47065151fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690897356; x=1691502156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uuAbqImQkExPHR4XWSuD8Ka/sF9NM7f2GPO5p0H+LnY=;
        b=aB3z7VtehPgA9B20jpheI/I4MV4vq7l7SKb4UQRefJf4O+LgpWDzPztKFCapVR2YJB
         VdC1rQJ9yHOrq5vo48MEX8R+dG4Euvy8ABt/8sTR2yQUNoS1Cp5wT2Fc3qLtZfTtilf7
         Igrg6AeuNQNgVMNCmKi0ntOz9UPlERT/obS0btx4pxek4QnFVrTYraDJvephif6sOG0h
         tHALuBasXnu8f8YqsQ65vvKdnLBSE8FNyNmjd5TRtFLEIhorWdKOjfeyu/OtbgagSQwa
         6nydDzkcSvikfbKqQneO6W1IcWIm6l2gMw6+bNreg1QIHD45+CxHRSJUUYaTwXi+AKJ2
         jwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690897356; x=1691502156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uuAbqImQkExPHR4XWSuD8Ka/sF9NM7f2GPO5p0H+LnY=;
        b=bEZa+nneIILZn0jO5GQom7slUjZKAJ8Mo3Nx4NeXdOM5w6Za+9VhzhRHB8/ECvmpep
         2Z0z3e/i4hVbI4U7lB5aSpMXfGqf6RtX1Q/NZbl2xHld33SSex2c1kc1W2TxcDCBNslI
         QNY4bHBWM6SQd+xJwMXXmRJYfEoSqk4AjoBy0jEBpLago2s9Y9i5EFvh6XSFIUpU+i1Q
         TZCX20Ej4yEFRODud+3RBRybQxyftPwV1n5ZMGDr64RlZujJPT6I5wgNYG4KFv/A57KY
         62fHfLNcf4AiwJC+fz1iksykgLxCWb2WjzWFqgIzxIQyN8k5Ub6lgHqnZIc9zJGHqm6+
         Jpxg==
X-Gm-Message-State: ABy/qLbd58/PZuicoAvJCvxgdlhy0++AvUeT6Y0MQEPhj0eZiqYs0dgC
	m0UL4qFL0uFb9a2t86QHwOYi9E3zlpRfYdA771E=
X-Google-Smtp-Source: APBJJlEMHJw/5mLEFjN8wYtMyJ44+a3y+IaKVDd3HLb0yosET3WL0mQ9HG6C/CXqj4NDvgtd4bWjujLe6/tVraDBODY=
X-Received: by 2002:a2e:2414:0:b0:2b6:dc55:c3c7 with SMTP id
 k20-20020a2e2414000000b002b6dc55c3c7mr2689927ljk.20.1690897356120; Tue, 01
 Aug 2023 06:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230801133833.96667-1-ppjadhav456@gmail.com>
In-Reply-To: <20230801133833.96667-1-ppjadhav456@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 1 Aug 2023 15:42:25 +0200
Message-ID: <CANNYZj_i401UutzN1ugqcWdkHV20cOJEbBhJvQ26WRoH1SMkpg@mail.gmail.com>
Subject: Re: [OE-core][master][PATCH] alsa-lib: Add ptest
To: Poonam Jadhav <ppjadhav456@gmail.com>
Cc: openembedded-core@lists.openembedded.org, poonam.jadhav@kpit.com, 
	ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Aug 2023 13:42:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185247

This doesn't address the points I raised previously. So it's still a no.

Alex

On Tue, 1 Aug 2023 at 15:39, Poonam Jadhav <ppjadhav456@gmail.com> wrote:
>
> From: Poonam Jadhav <poonam.jadhav@kpit.com>
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
>  .../recipes-multimedia/alsa/alsa-lib_1.2.9.bb | 22 +++++++++++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/run-ptest
>
> diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
> index 6250cf081e..99f09132ae 100644
> --- a/meta/conf/distro/include/ptest-packagelists.inc
> +++ b/meta/conf/distro/include/ptest-packagelists.inc
> @@ -5,6 +5,7 @@
>  #
>  PTESTS_FAST = "\
>      acl \
> +    alsa-lib \
>      apr-util \
>      attr \
>      babeltrace \
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
> diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
> index d482e27683..8dcd7c4448 100644
> --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
> +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb
> @@ -9,10 +9,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
>                      file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
>                      "
>
> -SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
> +SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2 \
> +           file://run-ptest \
> +          "
>  SRC_URI[sha256sum] = "dc9c643fdc4ccfd0572cc685858dd41e08afb583f30460b317e4188275f615b2"
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
> View/Reply Online (#185246): https://lists.openembedded.org/g/openembedded-core/message/185246
> Mute This Topic: https://lists.openembedded.org/mt/100483753/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

